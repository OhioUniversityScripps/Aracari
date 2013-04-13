ActiveAdmin.register Record do
  index do
    column "Legacy Asset ID", :legacy_asset_id
    column :further_review
    column :notes
    default_actions
  end
  
  form do |f|
    f.inputs "Admin Details" do
      f.input :legacy_asset_id
      f.input :further_review
      f.input :notes
    end                               
    f.actions                         
  end
  
end
