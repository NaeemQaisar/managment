class Student < ActiveRecord::Base
  attr_accessible :class, :fathername, :name

  belongs_to :teacher, dependent: :destroy
end
