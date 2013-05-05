class Image < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :record

  has_attached_file :file, storage: :filesystem

  validates_attachment_content_type :file, content_type: ['image/png', 'image/gif', 'image/jpeg']
  validates_attachment_presence :file, message: "must be attached"
  validates_attachment_size :file, greater_than: 0.megabytes
end
