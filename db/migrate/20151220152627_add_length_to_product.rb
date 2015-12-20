class AddLengthToProduct < ActiveRecord::Migration
  def change
    add_column :products, :length, :numeric
  end
end
