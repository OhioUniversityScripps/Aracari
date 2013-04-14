# require 'zip/zipfilesystem'

class Import < ActiveRecord::Base
  
  attr_accessible :archive
  
  has_attached_file :archive, :storage => :filesystem
  
  # def after_create
  #   Zip::ZipFile.open(self.archive_path) do |zipfile|
  #     zipfile.each do |file|
  #       # do something with file
  #     end
  #   end
  # end
end
