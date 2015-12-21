class Classroom < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :teacher
  belongs_to :student
end
