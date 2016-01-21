class Classroom < ActiveRecord::Base
  
  attr_accessible :description, :name, :attachments_attributes
  
  has_many :attachments, as: :attachable, dependent: :destroy
  accepts_nested_attributes_for :attachments
  
  belongs_to :user, dependent: :destroy
  
  has_many :students
  validates_uniqueness_of :name

  

# def self.search(search)
#   if search
#     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
#   else
#     find(:all)
#   end
# end



  define_index do 

		indexes name

    has created_at, updated_at

	end

end
