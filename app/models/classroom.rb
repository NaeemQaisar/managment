class Classroom < ActiveRecord::Base
  
  attr_accessible :description, :name, :attachments_attributes
  
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  
  
  has_many :students
  validates_uniqueness_of :name

  define_index do 

		indexes classroom(:name), :as => :classroom, :sortable => true

    has created_at, updated_at
	end

end
