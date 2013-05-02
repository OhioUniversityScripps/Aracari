ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    
    columns do
      column do
        panel "Overview"
      end
      
      column do
        panel "Recent Imports" do
          ul do
            Import.recent(5).map do |import|
              li link_to(import.created_at, admin_import_path(import))
            end
          end
        end
        
        panel "Recent Records" do
          ul do
            Record.recent(5).map do |record|
              li link_to(record.title, admin_record_path(record))
            end
          end
        end
      end

      column do
        panel "Contact" do
          para "Need help? Contact #{link_to 'Ricky Chilcott', 'mailto:chilcotr@ohio.edu'}".html_safe
        end
        
        panel "Aracari Info" do
          para "Welcome to #{link_to 'Aracari', 'https://github.com/OhioUniversityScripps/Aracari'}, built in Ruby on Rails using ActiveAdmin, Postgres, CSV parsing, and other goodies. Find more information on the #{link_to 'wiki', 'https://github.com/OhioUniversityScripps/Aracari/wiki'}.".html_safe
        end
        
        panel "Guyana National Archives Media Assessment Project" do
          para "There is specific project files associated with the Guyana National Archives Media Assessment Project located at the #{link_to 'project repository', 'https://github.com/OhioUniversityScripps/guyana1804grant'}.".html_safe
        end
      end
    end
  end # content
end
