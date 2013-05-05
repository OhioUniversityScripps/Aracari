class Import < ActiveRecord::Base

  attr_accessible :archive

  has_attached_file :archive, storage: :filesystem, path: "#{Rails.root}/public/uploads/:class/:id/:basename.:extension"

  validates_attachment_content_type :archive, content_type: 'application/zip', required: true
  validates_with AttachmentPresenceValidator, attributes: :archive, message: "must be attached"

  scope :recent, lambda {|count| where("created_at < ?", Time.zone.now).limit(count) }


  # after_save { FormConnectParser.new(self.archive_file_name).parse! }
end
