class AddSortingToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :sorting, :integer
  end
end
