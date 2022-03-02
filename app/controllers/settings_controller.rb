class SettingsController < ShopifyApp::AuthenticatedController
  skip_before_action :verify_authenticity_token

  def index
    @shop_domain = params[:shop_domain]
    setting = Setting.where(shop_domain: params[:shop_domain]).first
    if setting.present?
      @setting = setting
    else
      @setting = Setting.new
    end
  end

  def info
    @setting = Setting.where(shop_domain: params[:shop_domain])[0]
    request.format = :json
    respond_to do |format|
      format.json { render json: @setting, :callback => params[:callback] }
    end
  end

  def create_or_update
    shop = Shop.where(shopify_domain: params[:shop_domain])[0]
    if setting = Setting.where(shop_id: shop.id).first
      setting.update_attributes(setting_params)
    else
      setting = Setting.new(setting_params)
      setting.shop_id = shop.id
      setting.save
    end
  end

  private

  def setting_params
    params.permit(:shop_domain, :user_message, :notification_message)
  end

end
