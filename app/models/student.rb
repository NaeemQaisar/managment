class Student < ActiveRecord::Base
  attr_accessible :section, :fathername, :name

  belongs_to :classroom, dependent: :destroy
  validates_uniqueness_of :name
end
