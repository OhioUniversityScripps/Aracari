class Record < ActiveRecord::Base
  # field :legacy_asset_id, type: String
  # field :title, type: String
  # field :creators, type: String
  # field :category, type: String
  # field :content_description, type: String
  # field :further_review, type: Boolean
  # 
  # field :assessors, type: String
  # field :collection_id, type: String
  # field :shelf_code, type: String
  # field :year, type: Integer
  # field :month, type: Integer
  # field :day, type: Integer
  # 
  # field :generation, type: String
  # field :unique_id, type: String
  # 
  # embeds_many :images, cascade_callbacks: true
  # # has_many :images
  # 
  # # Characteristics
  # field :size, type: String
  # field :media_type, type: String
  # field :speed, type: String
  # field :stock_manufacturer, type: String
  # field :track_configuration, type: String
  # field :stock_brand, type: String
  # field :tape_thickness, type: String
  # field :stock_formula, type: String
  # field :tape_playback_direction, type: String
  # field :asset_age, type: String
  # field :tape_width, type: String
  # field :known_running_time, type: String
  # field :tape_noise_reduction, type: String
  # 
  # # Reel Condition
  #   # Column One
  #   field :popped_strands, type: Boolean
  #   field :stepped_pack, type: Boolean
  #   field :flange_pack, type: Boolean
  #   field :unsecured_tape, type: Boolean
  #   field :heads_out, type: Boolean
  #   field :vinegar_odor, type: Boolean
  #   field :other_odor, type: Boolean
  #   
  #   # Column Two
  #   field :backing_loss, type: Boolean
  #   field :binder_loss, type: Boolean
  #   field :blocking, type: Boolean
  #   field :brittleness, type: Boolean
  #   field :breakage, type: Boolean
  #   field :cinching, type: Boolean
  #   field :cupping, type: Boolean
  # 
  #   # Column Three
  #   field :delamination, type: Boolean
  #   field :edge_curling, type: Boolean
  #   field :edge_damage, type: Boolean
  #   field :stretching, type: Boolean
  #   field :spoking, type: Boolean
  #   field :windowing, type: Boolean
  #   field :wrinkling, type: Boolean
  #   
  #   # Column Four
  #   field :dirt_dust, type: Boolean
  #   field :fungus, type: Boolean
  #   field :liquid, type: Boolean
  #   field :pest, type: Boolean
  #   field :slotted_hub, type: Boolean
  #   field :splices, type: Boolean
  #   
  # # Record/Cassette Condition
  # field :record_cassette_cracks, type: Boolean
  # field :record_cassette_delamination, type: Boolean
  # field :record_cassette_scratches, type: Boolean 
  # field :record_cassette_surface_contamination, type: Boolean
  # field :record_cassette_warping, type: Boolean
  # 
  # field :condition_notes, type: String
  # 
  # field :notes, type: String
end
