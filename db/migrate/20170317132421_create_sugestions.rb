class CreateSugestions < ActiveRecord::Migration
  def change
    create_table :sugestions do |t|
      t.text :content
      t.integer :review
      t.references :user
      t.references :song
      t.references :activity

      t.timestamps
    end
  end
end
