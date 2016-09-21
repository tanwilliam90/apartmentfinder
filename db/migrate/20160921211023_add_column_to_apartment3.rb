class AddColumnToApartment3 < ActiveRecord::Migration
  def change
    add_reference :apartments, :user, index: true, foreign_key: true
    add_column :apartments, :phone, :string
    add_column :apartments, :time, :text
  end
end
