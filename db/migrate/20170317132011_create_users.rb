class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :hashed_password
      t.integer :country_id
      t.string :language

      t.timestamps
    end

  end
end
