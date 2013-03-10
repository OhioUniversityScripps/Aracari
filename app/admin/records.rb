ActiveAdmin.register Record do
  index do
    column :asset_id
    column :notes
    column :misc
    default_actions
  end
  
  form do |f|
    f.inputs "Admin Details" do
      f.input :asset_id
      f.input :notes
      f.input :misc
    end                               
    f.actions                         
  end
  
end
