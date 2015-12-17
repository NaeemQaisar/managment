class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :fathername
      t.text :designation

      t.timestamps
    end
  end
end
