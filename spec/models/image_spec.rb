require 'spec_helper'

describe Image do

  it { should have_attached_file(:file) }

  it { should validate_attachment_presence(:file) }

  it { should validate_attachment_content_type(:file).
                allowing('image/png', 'image/gif', 'image/jpeg').
                rejecting('text/plain', 'text/xml', 'application/zip') }

  it { should validate_attachment_size(:file).greater_than(0.megabytes) }
end
