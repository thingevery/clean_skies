class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name
      t.text :album_description
      t.date :date_created
      t.integer :user_id

      t.timestamps
    end
  end
end
