class Import < ActiveRecord::Base

  attr_accessible :archive, :assessors, :notes

  has_attached_file :archive, storage: :filesystem

  validates_attachment_content_type :archive, content_type: 'application/zip', required: true
  validates_with AttachmentPresenceValidator, attributes: :archive, message: "must be attached"

  scope :recent, lambda {|count| where("created_at < ?", Time.zone.now).limit(count) }

  # Parse the form after save (but only on create)
  # We should be able to use after_create but it will not work because of Paperclip's implimentation
  # of it's attachment API happens in after_save (and we need the Paperclip after_save callback to be called)
  after_save { FormConnectParser.parse(self.archive.path) if created_at_changed? }
end
