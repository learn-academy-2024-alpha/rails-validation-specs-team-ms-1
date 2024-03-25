class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
