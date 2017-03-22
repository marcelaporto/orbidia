class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.references :genres
      t.references :country

      t.timestamps
    end
  end
end
