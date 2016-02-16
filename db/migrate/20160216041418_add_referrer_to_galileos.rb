class AddReferrerToGalileos < ActiveRecord::Migration
  def change
    add_column :galileos, :referrer, :string
  end
end
