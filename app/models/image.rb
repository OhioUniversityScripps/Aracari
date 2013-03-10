class Image
  include Mongoid::Document
  
  field :upload_filename, :type => String
  
  mount_uploader :uploader, ImageUploader
end
