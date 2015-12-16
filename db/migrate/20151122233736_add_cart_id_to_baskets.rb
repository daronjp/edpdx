class AddCartIdToBaskets < ActiveRecord::Migration
  def change
    add_column :baskets, :cart_id, :integer
  end
end
