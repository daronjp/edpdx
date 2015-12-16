class Cart < ActiveRecord::Base
  has_many :carts
  has_many :cart_items
  belongs_to :customer
end
