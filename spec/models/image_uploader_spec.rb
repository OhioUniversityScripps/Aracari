require 'spec_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers
  
  let(:image) { build(:image) }
  
  # after do
  #   @uploader.remove!
  # end
  
  
  it "must save a valid record" do
    image.should be_valid
  end
  
end