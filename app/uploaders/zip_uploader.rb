# encoding: utf-8

class ZipUploader < CarrierWave::Uploader::Base

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file
  
  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    "zip"
  end
end
