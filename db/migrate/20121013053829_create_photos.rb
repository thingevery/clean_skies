class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :photo_description
      t.date :date_taken
      t.integer :album_id

      t.timestamps
    end
  end
end
