class CreateGalileos < ActiveRecord::Migration
  def change
    create_table :galileos do |t|
      t.string :controller
      t.string :view
      t.integer :object
      t.string :ip

      t.timestamps null: false
    end
  end
end
