class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :nickname
      t.string :email
      t.string :profile_pic
      t.date :date_of_birth
      t.text :description
      t.string :location
      t.date :date_joined

      t.timestamps
    end
  end
end
