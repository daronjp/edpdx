class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.decimal :price
      t.decimal :height
      t.decimal :width
      t.integer :quantity
      t.text :description

      t.timestamps null: false
    end
  end
end
