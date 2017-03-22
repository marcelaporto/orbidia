class CreateCountriesLanguages < ActiveRecord::Migration
  def change
    create_table :countries_languages do |t|
      t.integer :country_id
      t.integer :language_id

      t.timestamps
    end
  end
end
