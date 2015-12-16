class AddTrackingIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :tracking_id, :string
  end
end
