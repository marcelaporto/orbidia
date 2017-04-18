class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :spotify_iso_id #ISO 3166-1 alpha-2

      t.timestamps
    end
  end
end
