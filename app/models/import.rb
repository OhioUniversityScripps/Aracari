class Import < ActiveRecord::Base

  attr_accessible :archive, :assessors, :notes

  has_attached_file :archive, storage: :filesystem

  validates_attachment_content_type :archive, content_type: 'application/zip', required: true
  validates_with AttachmentPresenceValidator, attributes: :archive, message: "must be attached"

  scope :recent, lambda {|count| where("created_at < ?", Time.zone.now).limit(count) }


  after_create { FormConnectParser.new(self.archive.path).parse }
end
