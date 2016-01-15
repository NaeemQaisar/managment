class StudentsTeachers < ActiveRecord::Migration
 def up
  	
 		create_table 'students_teachers', :id => false do |t|
 			t.column 'student_id', :integer
 			t.column 'teacher_id', :integer
  		end
	end
	def down

		drop_table 'students_teachers'
	end
end
