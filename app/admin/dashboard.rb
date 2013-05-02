ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    
    columns do
      column do
        panel "Recent Imports" do
          ul do
            Import.recent(5).map do |import|
              li link_to(import.created_at, admin_import_path(import))
            end
          end
        end
      end
      
      column do
        panel "Recent Records" do
          ul do
            Record.recent(5).map do |record|
              li link_to(record.title, admin_record_path(record))
            end
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to #{link_to 'Aracari', 'https://github.com/OhioUniversityScripps/Aracari'}, built in Ruby on Rails using ActiveAdmin, Postgres, CSV parsing, and other goodies. Find more information on the #{link_to 'Wiki', 'https://github.com/OhioUniversityScripps/Aracari/wiki'}".html_safe
        end
      end
    end
  end # content
end
