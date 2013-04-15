class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :record
  has_attached_file :file
end
