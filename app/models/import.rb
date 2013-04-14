class Import < ActiveRecord::Base
  attr_accessible :archive
  
  has_attached_file :archive
end
