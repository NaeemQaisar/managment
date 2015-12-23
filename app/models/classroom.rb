class Classroom < ActiveRecord::Base
  attr_accessible :description, :name

  
  has_many :students
  validates_uniqueness_of :name
end
