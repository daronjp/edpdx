class Customer < ActiveRecord::Base
  has_one :cart
end
