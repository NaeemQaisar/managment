class Student < ActiveRecord::Base
  attr_accessible :section, :fathername, :name, :attachments_attributes

  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments

  belongs_to :classroom, dependent: :destroy
  validates_uniqueness_of :name
  has_and_belongs_to_many :teachers
end
