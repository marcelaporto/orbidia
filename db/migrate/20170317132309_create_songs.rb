class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.references :artists
      t.references :genres

      t.timestamps
    end
  end
end
