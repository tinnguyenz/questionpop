class Customer < ApplicationRecord
  serialize :property, Hash
end
