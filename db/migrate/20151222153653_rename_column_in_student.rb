class RenameColumnInStudent < ActiveRecord::Migration
  def up
  	rename_column :students, :class, :section
  end

  def down
  	rename_column :students, :section, :class
  end
end
