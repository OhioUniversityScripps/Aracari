class Import
  include Mongoid::Document
  
  mount_uploader :uploader, ZipUploader
  
end
