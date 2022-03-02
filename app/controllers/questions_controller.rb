class QuestionsController < ShopifyApp::AuthenticatedController
  require 'sendgrid-ruby'
  include SendGrid
  include Mailable
  require 'json'

  around_action :shopify_session, :only => [:index, :show, :unanswered_questions, :answered_questions]
  before_action :set_base_url
  before_action :set_headers, :only => [:create]
  before_action :current_shop, :only => [:index, :show, :unanswered_questions, :answered_questions]
  skip_before_action  :verify_authenticity_token
  require 'lib/api_utils'

  def index
    @questions = Question.where(shop_domain: @current_shop.shopify_domain).paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @current_tab = request.path == "/" || request.path == "/questions" ? "/all_questions" : request.path
  end

  def new
  end

  def show
    @question = Question.where(id: params[:id]).first
    @product = ShopifyAPI::Product.where(id: @question.product_id.to_i).first
    @question_and_answers = (QuestionContent.includes(:question).where(question_id: params[:id]) +
      Answer.includes(:question).where(question_id: params[:id])).sort_by(&:created_at)

    @product_image_url = @product.images.size >= 1 ? @product.images.first.src : ""
    @product_shop_admin_url = "https://#{@current_shop.shopify_domain}/admin/products/#{@product.id}?locale=#{@current_shop.primary_locale}"

    respond_to do |format|
      format.html
    end
  end

  def create
    shop = Shop.where(shopify_domain: question_params[:shop_domain])[0]
    existing_question = Question.existing_question(question_params[:customer_email], question_params[:product_id])

    if existing_question.present?
      QuestionContent.create(question_id: existing_question.id, content: question_params[:question_content])
    else
      @question = Question.new(question_params)
      @question.shop_id = shop.id
      @question.save
    end

    authorize_shop(shop)

    notify_merchant(question_params)
  end

  def unanswered_questions
    @questions = Question.where(is_answered: false).where(shop_domain: @current_shop.shopify_domain).paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @current_tab = request.path
  end

  def answered_questions
    @questions = Question.where(is_answered: true).where(shop_domain: @current_shop.shopify_domain).paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @current_tab = request.path
  end

  def answer_mark
    Question.where(id: answer_mark_params[:id]).update(is_answered: true)
  end

  def add_answer
    question = Question.where(id: answer_params[:question_id]).first
    shop = Shop.where(id: question.shop_id).first

    authorize_shop(shop)

    Answer.create(content: answer_params[:content], question_id: answer_params[:question_id])

    answer_data = {shop: shop, question: question, answer: Answer.last}
    notify_shopper(answer_data)
  end

  def reload_answers
    @question_and_answers = (QuestionContent.includes(:question).where(question_id: params[:question_id]) +
      Answer.includes(:question).where(question_id: params[:question_id])).sort_by(&:created_at)
    @question = Question.where(id: params[:question_id]).first
    @flash_message = "Answer has been sent to <i>#{@question.customer_email}</i>".html_safe

    render partial: "questions/answer_box",
      question_and_answers: @question_and_answers,
      question: @question
  end

  private

  def current_shop
    shop = ShopifyAPI::Shop.current
    @current_shop = Shop.where(shopify_domain: shop.myshopify_domain)[0]
    @current_shop.primary_locale = shop.primary_locale
  end

  def set_base_url
    @base_url = Rails.configuration.url[:base_url]
  end

  def question_params
    params.permit(:shop_domain, :product_id, :question_id, :customer_email, :customer_name, :question_content)
  end

  def answer_mark_params
    params.permit(:id)
  end

  def answer_params
    params.permit(:content, :question_id)

  end

  def set_headers
    if request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end

  def authorize_shop(shop)
    session = ShopifyAPI::Session.new(domain: shop.shopify_domain, token: shop.shopify_token, api_version: "2020-01")
    ShopifyAPI::Base.activate_session(session)
  end

  def notify_merchant(question_data)
    shop = ShopifyAPI::Shop.current
    product = ShopifyAPI::Product.find(question_params[:product_id].to_i)
    question_data[:product] = product
    question_data[:shop] = shop

    from = Email.new(email: 'jase@questionpop.herokuapp.com')
    subject = 'Question Pop: A Question Asked on your Product'
    to = Email.new(email: shop.email)
    to_jase = Email.new(email: "tinnguyen911@gmail.com")

    content = Content.new(type: 'text/html', value: email_content(question_data))
    mail = Mail.new(from, subject, to, content)
    mail_to_jase = Mail.new(from, subject, to_jase, content)
    # puts JSON.pretty_generate(mail.to_json)

    sg = SendGrid::API.new(api_key: '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', host: 'https://api.sendgrid.com')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response_to_jase = sg.client.mail._('send').post(request_body: mail_to_jase.to_json)
  end

  def email_content(question_data)
    product_image_url = question_data[:product].images.size >= 1 ? question_data[:product].images.first.src : ""

    wrapper_style = 'background: #464849; font-family: Arial, Helvetica, sans-serif;'
    container_style = 'max-width: 600px; margin: 8% auto; padding: 0; color: #666;' +
      'font-size: 16px; line-height: 1.6; border-radius: 10px; box-shadow: 0 3px 20px rgba(0, 0, 0, 0.03);'
    header_style = 'font-size: 1.5rem; font-weight: 700;' +
      'color: #fff; font-family: Arial, Helvetica, sans-serif;'
    row_detail_style = 'width: 100%; padding-top: 10px; padding-bottom: 10px;'
    title_style = 'color: #fff; display: inline-block; width: 25%; float: left;'+
      'font-size: 1.1em; font-family: sans-serif; text-decoration: underline;'
    detail_style = 'color: #fff;'
    hr_style = 'display: block; margin-top: 1em; margin-bottom: 1em; margin-left: auto; ' +
      'margin-right: auto; border-style: inset; border-width: 1px; width: 75%;'
    img_style = 'width: 20%; height: 20%'

    html =
      "<html><body>" +
      "   <div style='#{wrapper_style}'>" +
      "       <div style='#{container_style}'" +
      "           <span style='#{header_style}'>:</span>" +
      "           <div style='#{row_detail_style}'>" +
      "               <div style='#{header_style}'>Hey #{question_data[:shop].shop_owner}. Jase's here. " +
      "                 Please review the question bellow.</div>" +
      "           </div>" +
      "           <hr style='#{hr_style}'>" +

      "           <div style='#{row_detail_style}'>" +
      "               <div style='#{title_style}'>Shopper Info: </div>" +
      "               <div style='#{detail_style}'>#{question_data[:customer_name]}</div>" +
      "           </div>" +
      "           <div style='#{row_detail_style}'>" +
      "               <div style='#{title_style} text-decoration: none;'>&nbsp;</div>" +
      "               <div style='#{detail_style}'>#{question_data[:customer_email]}</div>" +
      "           </div></br>" +

      "           <div style='#{row_detail_style}'>" +
      "               <div style='#{title_style}'>Question: </div>" +
      "               <div style='#{detail_style}'>#{question_data[:question_content]}</div>" +
      "           </div></br>" +

      "           <div style='#{row_detail_style}'>" +
      "               <div style='#{title_style}'>Product: </div>" +
      "               <div style='#{detail_style}'>#{question_data[:product].title}</div>" +
      "           </div>" +
      "           <div style='#{row_detail_style}'>" +
      "               <div style='#{title_style} text-decoration: none;'>&nbsp;</div>" +
      "               <div style='#{detail_style}'><img style='#{img_style}' src='#{product_image_url}'/></div>" +
      "           </div>" +
      "       </div>" +
      "   </div>"
      "</body></html>"
    html.html_safe
  end

end
