class AddPaperclipToApartment < ActiveRecord::Migration
  def change
    add_attachment :apartments, :image
  end
end
