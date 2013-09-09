require 'spec_helper'

describe StorageLocation do
  it "must have at least one location" do
    expect(StorageLocation.count).to be > 0
  end
  
  it "must have a location in the University of Guyana Library" do
    expect(StorageLocation[:ug_library].value).to eq('University of Guyana Library')
  end

  it "must have a location in the National Archives" do
    expect(StorageLocation[:national_archives].value).to eq('National Archives')
  end
end
