class Record < ActiveRecord::Base
  attr_accessible :legacy_asset_id,  :title,  :creators,  :category,
                  :content_description,  :further_review,  :assessors,
                  :collection_id,  :shelf_code,  :year,  :month,  :day,
                  :generation,  :unique_id,  :size,  :media_type,  :speed,
                  :stock_manufacturer,  :track_configuration,  :stock_brand,
                  :tape_thickness,  :stock_formula,  :tape_playback_direction,
                  :asset_age,  :tape_width,  :known_running_time,
                  :tape_noise_reduction,  :popped_strands,  :stepped_pack,
                  :flange_pack,  :unsecured_tape,  :heads_out,  :vinegar_odor,
                  :other_odor,  :backing_loss,  :binder_loss,  :blocking,
                  :brittleness,  :breakage,  :cinching,  :cupping,  :delamination,
                  :edge_curling,  :edge_damage,  :stretching,  :spoking,
                  :windowing,  :wrinkling,  :dirt_dust,  :fungus,  :liquid,
                  :pest,  :slotted_hub,  :splices,  :record_cassette_cracks,
                  :record_cassette_delamination,  :record_cassette_scratches,
                  :record_cassette_surface_contamination,
                  :record_cassette_warping,  :condition_notes,  :notes, :midterm_storage_location

  has_many :images

  scope :recent, lambda {|count| where("created_at < ?", Time.zone.now).limit(count) }

  # validate :unique_id, uniqueness: { scope: :assessors }

  # Generate barcode that has value of collection_id-id
  # (e.g. "cultural_center-511")
  include HasBarcode
  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_93,
    :value => Proc.new { |r| "#{r.collection_id.parameterize.underscore}-#{r.id}" }

  def midterm_storage_location_value
    midterm_storage_location ? StorageLocation[midterm_storage_location.to_sym].value : nil
  end
  
end
