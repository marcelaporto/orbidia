class CreateSugestions < ActiveRecord::Migration
  def change
    create_table :sugestions do |t|
      t.text :content
      t.integer :review
      t.references :users
      t.references :songs
      t.references :activities

      t.timestamps
    end
  end
end
