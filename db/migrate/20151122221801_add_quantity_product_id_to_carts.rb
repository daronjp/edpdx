class AddQuantityProductIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :quantity, :integer
    add_column :carts, :product_id, :integer
  end
end
