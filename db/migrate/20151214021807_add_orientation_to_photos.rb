class AddOrientationToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :orientation, :string
  end
end
