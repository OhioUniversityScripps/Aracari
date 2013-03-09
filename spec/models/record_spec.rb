require 'spec_helper'

describe Record do
  let(:record) { build(:record) }

  it "must save a valid record" do
    record.should be_valid
  end
  
end
