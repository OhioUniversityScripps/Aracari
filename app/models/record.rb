class Record
  include Mongoid::Document
  
  field :asset_id, :type => String
  field :notes, :type => String
  field :misc, :type => String
end
