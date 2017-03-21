class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.references :users #not working
      t.references :preferable, polymorphic: true, index: true
    end
  end
end
