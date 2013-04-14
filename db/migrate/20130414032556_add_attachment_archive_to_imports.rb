class AddAttachmentArchiveToImports < ActiveRecord::Migration
  def self.up
    change_table :imports do |t|
      t.attachment :archive
    end
  end

  def self.down
    drop_attached_file :imports, :archive
  end
end
