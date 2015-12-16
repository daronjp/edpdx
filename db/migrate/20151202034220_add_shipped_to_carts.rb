class AddShippedToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :shipped, :boolean
  end
end
