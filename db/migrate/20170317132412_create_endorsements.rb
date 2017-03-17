class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.references :sugestions
      t.references :users
    end
  end
end
