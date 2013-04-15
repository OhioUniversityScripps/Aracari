class Record < ActiveRecord::Base
  attr_accessible :legacy_asset_id,  :title,  :creators,  :category,  :content_description,  :further_review,  :assessors,  :collection_id,  :shelf_code,  :year,  :month,  :day,  :generation,  :unique_id,  :size,  :media_type,  :speed,  :stock_manufacturer,  :track_configuration,  :stock_brand,  :tape_thickness,  :stock_formula,  :tape_playback_direction,  :asset_age,  :tape_width,  :known_running_time,  :tape_noise_reduction,  :popped_strands,  :stepped_pack,  :flange_pack,  :unsecured_tape,  :heads_out,  :vinegar_odor,  :other_odor,  :backing_loss,  :binder_loss,  :blocking,  :brittleness,  :breakage,  :cinching,  :cupping,  :delamination,  :edge_curling,  :edge_damage,  :stretching,  :spoking,  :windowing,  :wrinkling,  :dirt_dust,  :fungus,  :liquid,  :pest,  :slotted_hub,  :splices,  :record_cassette_cracks,  :record_cassette_delamination,  :record_cassette_scratches,  :record_cassette_surface_contamination,  :record_cassette_warping,  :condition_notes,  :notes

  # embeds_many :images, cascade_callbacks: true
  # has_many :images
  
  def self.parse(xml)
    doc = Nokogiri.XML(xml)
    
    # loop through each record
    doc.xpath('//record').each do |record|
      # build a new record
      record_builder = Record.new
            
      record.xpath('///field').each do |field|
        # set all attributes        
        case
          when field  == 'Unnamed Field' # all images
          
          else # default
            attribute, value = field[:name].parameterize.underscore.to_sym, field.text.strip
            
            record_builder[attribute] = value
        end
      end
      
      # save
      record_builder.save!
      # binding.pry
    end
  end
end
