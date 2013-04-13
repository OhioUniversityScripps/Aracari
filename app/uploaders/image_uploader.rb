# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file
  
  # Add a white list of extensions which are allowed to be uploaded.
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
end