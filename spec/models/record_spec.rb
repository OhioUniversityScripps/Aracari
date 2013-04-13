require 'spec_helper'

describe Record do
  let(:record) { build(:record) }

  it "must save a valid record" do
    record.should be_valid
  end
  
  it "should support dynamic fields" do
    expect { record.pest }.to raise_error NoMethodError
    
    record[:pest] = true
    record[:pest].should be_true
    
    record.write_attribute(:speed, "33 RPM").should be_true
    record.read_attribute(:speed).should be_true
  end
  
end
