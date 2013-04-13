ActiveAdmin.register Import do

  index do
    column :uploader_url
    column :created_at
    
    default_actions
  end
  
  form do |f|
    f.inputs "Content" do
      f.input :uploader, as: :file
    end
    
    f.actions
  end
end
