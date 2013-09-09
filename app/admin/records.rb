ActiveAdmin.register Record do

  index do
    column :title
    column :creators
    column "Legacy Asset ID", :legacy_asset_id
    column :further_review
    
    default_actions
  end

  form do |f|
    f.inputs "Content" do
      f.input :legacy_asset_id, label: "Legacy Asset ID"

      f.input :title
      f.input :creators
      f.input :category
      f.input :content_description, label: "Content Description"
      f.input :further_review, as: :boolean, label: "Further Review"

      f.input :assessors
      f.input :collection_id, label: "Collection"
      f.input :shelf_code, label: "Shelf Code"
      f.input :year
      f.input :month
      f.input :day
      f.input :generation
      f.input :unique_id, label: "Unique ID"
      
      f.input :midterm_storage_location, label: "Midterm Storage Location",
          as: :select, collection: options_for_select(StorageLocation.map {|loc| [loc.value, loc.key]}, selected: f.object.midterm_storage_location)
    end

    f.inputs "Characteristics" do
      f.input :size
      f.input :media_type, label: "Media Type"
      f.input :speed
      f.input :stock_manufacturer, label: "Stock Manufacturer"
      f.input :track_configuration, label: "Track Configuration"
      f.input :stock_brand, label: "Stock Brand"
      f.input :tape_thickness, label: "Tape Thickness"
      f.input :stock_formula, label: "Stock Formula"
      f.input :tape_playback_direction, label: "Tape Playback Direction"
      f.input :asset_age, label: "Asset Age"
      f.input :tape_width, label: "Tape Width"
      f.input :known_running_time, label: "Known Running Time"
      f.input :tape_noise_reduction, label: "Tape Noise Reduction"
    end

    f.inputs "Reel Condition" do
      # Column One
      f.input :popped_strands, as: :boolean, label: "Popped Strands"
      f.input :stepped_pack, as: :boolean, label: "Stepped Pack"
      f.input :flange_pack, as: :boolean, label: "Flange Pack"
      f.input :unsecured_tape, as: :boolean, label: "Unsecured Tape"
      f.input :heads_out, as: :boolean, label: "Heads Out"
      f.input :vinegar_odor, as: :boolean, label: "Vinegar Odor"
      f.input :other_odor, as: :boolean, label: "Other Odor"

      # Column Two
      f.input :backing_loss, as: :boolean, label: "Backing Loss"
      f.input :binder_loss, as: :boolean, label: "Binder Loss"
      f.input :blocking, as: :boolean
      f.input :brittleness, as: :boolean
      f.input :breakage, as: :boolean
      f.input :cinching, as: :boolean
      f.input :cupping, as: :boolean

      # Column Three
      f.input :delamination, as: :boolean
      f.input :edge_curling, as: :boolean, label: "Edge Curling"
      f.input :edge_damage, as: :boolean, label: "Edge Damage"
      f.input :stretching, as: :boolean
      f.input :spoking, as: :boolean
      f.input :windowing, as: :boolean
      f.input :wrinkling, as: :boolean

      # Column Four
      f.input :dirt_dust, as: :boolean, label: "Dirt/Dust"
      f.input :fungus, as: :boolean
      f.input :liquid, as: :boolean
      f.input :pest, as: :boolean
      f.input :slotted_hub, as: :boolean, label: "Slotted Hub"
      f.input :splices, as: :boolean
    end

    f.inputs "Record/Cassette Condition" do
      f.input :record_cassette_cracks, as: :boolean, label: "Cracks"
      f.input :record_cassette_delamination, as: :boolean, label: "Delamination"
      f.input :record_cassette_scratches, as: :boolean, label: "Scratches"
      f.input :record_cassette_surface_contamination, as: :boolean, label: "Surface Contamination"
      f.input :record_cassette_warping, as: :boolean, label: "Warping"
    end

    f.inputs "Notes" do
      f.input :condition_notes, as: :text, label: "Condition Notes"

      f.input :notes, as: :text
    end

    f.actions
  end

  show do |record|
    h3 record.title
    
    panel "Barcode" do
      attributes_table_for record do
        row :barcode do
          record.barcode_data.html_safe
        end
      end
    end

    panel "Content" do
      attributes_table_for record, :legacy_asset_id, :title, :creators, :category, :content_description, :further_review, :collection_id, :shelf_code, :year, :month, :day, :generation, :unique_id, :midterm_storage_location_value
    end
    
    panel "Characteristics" do
      attributes_table_for record, :size, :media_type, :speed, :stock_manufacturer, :track_configuration, :stock_brand, :tape_thickness, :stock_formula, :tape_playback_direction, :asset_age, :tape_width, :known_running_time, :tape_noise_reduction
    end

    panel "Reel Condition" do
      #Column One
      attributes_table_for record, :popped_strands, :stepped_pack, :flange_pack, :unsecured_tape, :heads_out, :vinegar_odor, :other_odor
      
      # Column Two
      attributes_table_for record, :backing_loss, :binder_loss, :blocking, :brittleness, :breakage, :cinching, :cupping
      
      # Column Three
      attributes_table_for record, :delamination, :edge_curling, :edge_damage, :stretching, :spoking, :windowing, :wrinkling
      
      # Column Four
      attributes_table_for record, :dirt_dust, :fungus, :liquid, :pest, :slotted_hub, :splices
      
    end
    
    panel "Record/Cassette Condition" do
      attributes_table_for record, :record_cassette_cracks, :record_cassette_delamination, :record_cassette_scratches, :record_cassette_surface_contamination, :record_cassette_warping
    end
    
    panel "Notes" do
      attributes_table_for record, :condition_notes, :notes
    end
    
    panel "Images" do
      record.images.each do |image|
        div do
          link_to(image_tag(image.file.url(:original, timestamp: false), width: '157px', height: '210px'), image.file.url(:original, timestamp: false), rel: "prettyPhoto[pp_gal]").html_safe
        end
      end
    end
  end

  ## CSV Customization
  csv do
    column :legacy_asset_id

    column :title
    column :creators
    column :category
    column :content_description
    column :further_review

    column :assessors
    column("Collection Name") { |record| record.collection_id }
    column :shelf_code
    column :year
    column :month
    column :day
    column :generation
    column("Unique ID") { |record| record.unique_id }

    column :size
    column :media_type
    column :speed
    column :stock_manufacturer
    column :track_configuration
    column :stock_brand
    column :tape_thickness
    column :stock_formula
    column :tape_playback_direction
    column :asset_age
    column :tape_width
    column :known_running_time
    column :tape_noise_reduction

    # Column One
    column :popped_strands
    column :stepped_pack
    column :flange_pack
    column :unsecured_tape
    column :heads_out
    column :vinegar_odor
    column :other_odor

    # Column Two
    column :backing_loss
    column :binder_loss
    column :blocking
    column :brittleness
    column :breakage
    column :cinching
    column :cupping

    # Column Three
    column :delamination
    column :edge_curling
    column :edge_damage
    column :stretching
    column :spoking
    column :windowing
    column :wrinkling

    # Column Four
    column :dirt_dust
    column :fungus
    column :liquid
    column :pest
    column :slotted_hub
    column :splices

    column("Record/Cassette Cracks") { |record| record.record_cassette_cracks }
    column("Record/Cassette Delamination") { |record| record.record_cassette_delamination }
    column("Record/Cassette Scratches") { |record| record.record_cassette_scratches }
    column("Record/Cassette Surface Contamination") { |record| record.record_cassette_surface_contamination }
    column("Record/Cassette Cassette Warping") { |record| record.record_cassette_warping }

    column :condition_notes

    column :notes
  end
end