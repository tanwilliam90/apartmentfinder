class DropOwnersTable < ActiveRecord::Migration
  def up
    drop_table :owners
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
