class RemoveFieldNameFromApartment < ActiveRecord::Migration
  def change
    remove_column :apartments, :owner_id, :references
  end
end
