class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :questions
  has_one :setting
  attr_accessor :primary_locale

  after_save :create_default_setting, :create_customer

  def api_version
    ShopifyApp.configuration.api_version
  end

  private

  def create_default_setting
    if !Setting.where(shop_domain: self.shopify_domain).first.present?
      Setting.create(
        notification_message: "Thanks for contacting us. We will get back to you later",
        user_message: "Submit your question for this product",
        shop_id: self.id,
        shop_domain: self.shopify_domain
        )
    end
  end

  def create_customer
    authorize_shop(self)

    shop = ShopifyAPI::Shop.current
    customer = Customer.where(myshopify_domain: shop.attributes[:myshopify_domain])

    if customer.any?
      customer.update_all({property: shop.attributes})
    else
      Customer.create(
        myshopify_domain: shop.attributes[:myshopify_domain],
        property: shop.attributes
      )
    end
  end

  private

  def authorize_shop(shop)
    session = ShopifyAPI::Session.new(domain: shopify_domain, api_version: api_version, token: shopify_token)
    ShopifyAPI::Base.activate_session(session)
  end
end
