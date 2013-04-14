ActiveAdmin.register Import do
  
  index do
    column :archive
    column :created_at
    
    default_actions
  end
  
  form :html => {:multipart => true} do |f|
    f.inputs "Content" do
      f.input :archive, as: :file
    end
    
    f.actions
  end
end
