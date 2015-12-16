class AddBasketToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :basket, :decimal
  end
end
