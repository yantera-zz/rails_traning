class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :salt
      t.string :email
      t.boolean :db
      t.string :roles
      t.integer :reviews_count, default: 0

      t.timestamps null: false
    end
  end
end
