class Classroom < ActiveRecord::Base
  
  attr_accessible :description, :name, :attachments_attributes
  
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  
  
  has_many :students
  validates_uniqueness_of :name

end
