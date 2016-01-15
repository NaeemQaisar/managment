class Teacher < ActiveRecord::Base
  attr_accessible :designation, :fathername, :name
  
  has_and_belongs_to_many :students
  validates_uniqueness_of :name
  

end
