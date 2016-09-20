class AddPaperclipToOwner < ActiveRecord::Migration
  def change
    add_attachment :owners, :image
  end
end
