class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :customer_id
      t.boolean :active
      t.boolean :purchase

      t.timestamps null: false
    end
  end
end
