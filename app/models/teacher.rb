class Teacher < ActiveRecord::Base
  attr_accessible :designation, :fathername, :name


  has_many :students, dependent: :destroy
end
