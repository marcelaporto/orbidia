class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :mail
      t.string :hashed_password
      t.references :country, foreign_key: true
    end
  end
end
