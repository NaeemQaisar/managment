class AddUserIdToClassrooms < ActiveRecord::Migration
  def up
  	
 		add_column :classrooms, :user_id, :integer

 		add_index :classrooms, :user_id
  end
	def down

		remove_index :classrooms, :user_id

		remove_column :classrooms, :user_id
	end
end
