ActiveAdmin.register Record do

  index do
    column "Legacy Asset ID", :legacy_asset_id
    column :further_review
    column :notes
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
    record.images.each do |image|

      div do
        image_tag(image.file.url)
      end
    end

  end

end
