class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      # t.references :languages => User chooses his language => Stretch: Languages are available according to country
      t.string :iso_id

      t.timestamps
    end
  end
end
