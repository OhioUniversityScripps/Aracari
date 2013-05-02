class Import < ActiveRecord::Base
  
  attr_accessible :archive
  
  has_attached_file :archive, :storage => :filesystem


  scope :recent, lambda {|count| where("created_at < ?", Time.zone.now).limit(count) }
end
