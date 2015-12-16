class CreateHqUsers < ActiveRecord::Migration
  def change
    create_table :hq_users do |t|
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.boolean :is_admin

      t.timestamps null: false
    end
  end
end
