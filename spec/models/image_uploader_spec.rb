require 'spec_helper'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    @uploader = ImageUploader.new(build(:user), :image)
    @uploader.store!(File.open(Rails.root.join('public/rails.png')))
  end
  
  after do
    @uploader.remove!
  end
  
  it "should upload the file" do
    File.exists?(@uploader.url).should be_true
  end
  
end