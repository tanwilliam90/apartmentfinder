class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.integer :postalcode
      t.string :state
      t.string :country
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
