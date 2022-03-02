class Setting < ApplicationRecord
  belongs_to :shop
  scope :shop, ->(shop_domain) { where(shop_domain: shop_domain) }
end
