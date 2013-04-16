require 'spec_helper'

describe FormConnectParser do
  before(:each) do
    FileUtils.rm('/tmp/test.xml') if File.exists?('/tmp/test.xml')
  end
  
  it "should expect files to exist" do
    expect { FormConnectParser.new('/tmp/test.xml') }.to raise_error FormConnectParseError

    FileUtils.touch('/tmp/test.xml')
    expect { FormConnectParser.new('/tmp/test.xml') }.to_not raise_error FormConnectParseError
  end
  
  it "should accept only *.xml or *.zip files" do
    file = Tempfile.new('test.bad')
    expect { FormConnectParser.new('/tmp/test.bad') }.to raise_error FormConnectParseError
  end
  
  it "should parse data" do
    let(:example_file) { Rails.root + 'spec/support/record_parse/example.xml' }
    let(:bad_example_file) { Rails.root + 'spec/support/record_parse/example.xml' }
    
    before(:each) do
      Record.destroy_all
    end
    
    it "should parse a valid example record" do
      FormConnectParser.parse(example_file)
      
      Record.count.should be(1)
      Record.first.legacy_asset_id.should eq("Music Tape 767 Pt.E V.6")
      Record.first.year.should eq(1978)
    end
    
    pending "should import images correctly" do
      FormConnectParser.parse(example_file)
      
      Record.first.images.count.should be(4)
    end
    
    it "should not error out on bad example" do
      FormConnectParser.new(bad_example_file)
      
      expect { FormConnectParser.parse(data) }.to_not raise_error
      
      Record.count.should be(0)
    end
  end
end