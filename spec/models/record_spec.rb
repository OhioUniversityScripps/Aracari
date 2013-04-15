require 'spec_helper'

describe Record do
  let(:record) { build(:record) }

  it "must save a valid record" do
    record.should be_valid
  end
  
  it "should not support dynamic fields" do
    expect { record.new_attribute }.to raise_error NoMethodError
  end

  describe "#parse" do
    let(:data) { File.read(Rails.root + "spec/support/record_parse/example.xml") }
    
    before(:each) do
      Record.destroy_all
    end
    
    it "should parse a valid example record" do
      Record.parse(data)
      
      Record.count.should be(1)
      Record.first.legacy_asset_id.should eq("Music Tape 767 Pt.E V.6")
      Record.first.year.should eq(1978)
    end
    
    pending "should import images correctly" do
      Record.parse(data)
      
      Record.first.images.count.should be(4)
    end
    
    it "should not error out on bad example" do
      data = File.read(Rails.root + "spec/support/record_parse/bad_example.xml")
      
      expect { Record.parse(data) }.to_not raise_error
      Record.count.should be(0)
    end
  end
end
