class Student < ActiveRecord::Base
  attr_accessible :class, :fathername, :name

  has_many :teachers, :through => :classrooms, :dependent => :destroy
end
