class Record
  include Mongoid::Document
  
  field :asset_id, :type => String
  field :notes, :type => String
  field :misc, :type => String
  
  embeds_many :images, cascade_callbacks: true
  # has_many :images
end
