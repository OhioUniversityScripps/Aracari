class Image
  include Mongoid::Document
  
  field :upload_filename, :type => String
  
  mount_uploader :uploader, ImageUploader
  
  validates_presence_of :uploader_url
end
