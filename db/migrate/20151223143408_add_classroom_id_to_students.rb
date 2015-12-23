class AddClassroomIdToStudents < ActiveRecord::Migration
  def up
  	
 		add_column :students, :classroom_id, :integer

 		add_index :students, :classroom_id
  end
	def down

		remove_index :students, :classroom_id

		remove_column :students, :classroom_id
	end
end
