class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.references :countries

      t.timestamps
    end
  end
end
