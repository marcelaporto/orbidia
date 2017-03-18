class CreateCountriesLanguages < ActiveRecord::Migration
  def change
    create_table :countries_languages do |t|
      t.references :countries
      t.references :languages

      t.timestamps
    end
  end
end
