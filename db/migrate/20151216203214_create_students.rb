class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :fathername
      t.integer :class

      t.timestamps
    end
  end
end
