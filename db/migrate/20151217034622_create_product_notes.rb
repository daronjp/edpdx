class CreateProductNotes < ActiveRecord::Migration
  def change
    create_table :product_notes do |t|
      t.integer :product_id
      t.string :note

      t.timestamps null: false
    end
  end
end
