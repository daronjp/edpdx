class AddSortingToProductCategories < ActiveRecord::Migration
  def change
    add_column :product_categories, :sorting, :integer
  end
end
