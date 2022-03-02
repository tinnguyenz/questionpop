class ContactController < ShopifyApp::AuthenticatedController
  before_action :set_headers
  around_action :shopify_session, except: :home_contact
  skip_before_action :verify_authenticity_token

  def new
    @contact = Contact.new
    @shop_domain = current_shop.domain
  end

  def create
    Contact.create(contact_params)
  end

  def home_contact
    Contact.create(contact_params)
  end

  private

  def current_shop
    ShopifyAPI::Shop.current
  end

  def contact_params
    params.permit(:shop_domain, :email, :content)
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
end
