require 'spec_helper'

describe Record do
  let(:record) { build(:record) }

  it "must save a valid record" do
    record.should be_valid
  end
  
  it "should not support dynamic fields" do
    expect { record.new_attribute }.to raise_error NoMethodError
  end
  
end
