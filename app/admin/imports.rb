ActiveAdmin.register Import do
  config.filters = false
  
  index do
    
    default_actions
  end
  
  form do |f|
    f.inputs "Content" do
      f.input :archive, as: :file
    end
    
    f.actions
  end
end
