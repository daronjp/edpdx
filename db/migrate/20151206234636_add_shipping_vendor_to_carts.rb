class AddShippingVendorToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :shipping_vendor, :string
  end
end
