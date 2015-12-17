class Product < ActiveRecord::Base
  has_many :photos
  has_many :cart_items
  has_many :product_notes
  has_one :product_category
end
