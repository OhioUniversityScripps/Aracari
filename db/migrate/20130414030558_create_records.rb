class CreateRecords < ActiveRecord::Migration
  def up
    create_table :records do |t|

      t.string :legacy_asset_id
      t.string :title
      t.string :creators
      t.string :category
      t.text :content_description
      t.boolean :further_review
      
      t.string :assessors
      t.string :collection_id
      t.string :shelf_code
      t.integer :year
      t.integer :month
      t.integer :day
      
      t.string :generation
      t.string :unique_id
      
      # Characteristics
      t.string :size
      t.string :media_type
      t.string :speed
      t.string :stock_manufacturer
      t.string :track_configuration
      t.string :stock_brand
      t.string :tape_thickness
      t.string :stock_formula
      t.string :tape_playback_direction
      t.string :asset_age
      t.string :tape_width
      t.string :known_running_time
      t.string :tape_noise_reduction
      
      # Reel Condition
        # Column One
        t.boolean :popped_strands
        t.boolean :stepped_pack
        t.boolean :flange_pack
        t.boolean :unsecured_tape
        t.boolean :heads_out
        t.boolean :vinegar_odor
        t.boolean :other_odor
        
        # Column Two
        t.boolean :backing_loss
        t.boolean :binder_loss
        t.boolean :blocking
        t.boolean :brittleness
        t.boolean :breakage
        t.boolean :cinching
        t.boolean :cupping
      
        # Column Three
        t.boolean :delamination
        t.boolean :edge_curling
        t.boolean :edge_damage
        t.boolean :stretching
        t.boolean :spoking
        t.boolean :windowing
        t.boolean :wrinkling
        
        # Column Four
        t.boolean :dirt_dust
        t.boolean :fungus
        t.boolean :liquid
        t.boolean :pest
        t.boolean :slotted_hub
        t.boolean :splices
        
      # Record/Cassette Condition
      t.boolean :record_cassette_cracks
      t.boolean :record_cassette_delamination
      t.boolean :record_cassette_scratches
      t.boolean :record_cassette_surface_contamination
      t.boolean :record_cassette_warping
      
      t.text :condition_notes
      
      t.text :notes
      
      t.timestamps
    end
  end
  
  def down
    drop_table :records
  end
end
