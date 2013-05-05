require 'spec_helper'

describe FormConnectParser do
  before(:each) do
    FileUtils.rm('/tmp/test.csv') if File.exists?('/tmp/test.csv')
  end
  
  let(:zip_file) { Rails.root + 'spec/support/record_parse/Analog Assessment (15 Records).zip'}
  
  it "should expect files to exist" do
    expect { FormConnectParser.new('/tmp/test.csv') }.to raise_error FormConnectParseError
  
    FileUtils.touch('/tmp/test.csv')
    expect { FormConnectParser.new('/tmp/test.csv') }.to_not raise_error FormConnectParseError
  end
  
  it "should accept only *.csv or *.zip files" do
    file = Tempfile.new('test.bad')
    expect { FormConnectParser.new('/tmp/test.bad') }.to raise_error FormConnectParseError
  end
  
  pending "should unzip file, if a *.zip" do
    File.exists?(zip_file).should be(true)
  end
  
  describe "should parse data" do
    let(:example_file) { Rails.root + 'spec/support/record_parse/example.csv' }
    let(:bad_example_file) { Rails.root + 'spec/support/record_parse/example.csv' }
    
    before(:each) do
      Record.destroy_all
    end
    
    it "should parse a valid example record" do
      FormConnectParser.parse(example_file)
      
      Record.count.should eq(15)
      
      #Let's check just the first record
      record = Record.first

      record.legacy_asset_id.should eq("308")
      record.assessors.should eq("Ashworth/Chilcott")
      record.title.should eq("A Choir for Christmas 1966")
      record.collection_id.should eq("NCN")
      record.creators.should eq("Ohio University Chorus; Singers; Mens/Womens Glee Club")
      record.shelf_code.should eq("")
      record.category.should eq("Music")
      record.year.should eq(1968)
      record.content_description.should eq("")
      record.month.should eq(1)
      record.day.should eq(1)
      record.further_review.should eq(false)
      record.generation.should eq("Original")
      record.unique_id.should eq("51")
      record.size.should eq("7-inch (Reel)")
      record.media_type.should eq("Reel, Acetate")
      record.speed.should eq("7 1/2 IPS (home hifi reel-to-reel)")
      record.stock_manufacturer.should eq("3M")
      record.track_configuration.should eq("")
      record.stock_brand.should eq("Scotch")
      record.tape_thickness.should eq("Standard Play (1.5 mil base)")
      record.stock_formula.should eq("111")
      record.tape_playback_direction.should eq("Bidirectional")
      record.asset_age.should eq("")
      record.tape_width.should eq("1/4\"")
      record.known_running_time.should eq("29")
      record.tape_noise_reduction.should eq("")
      record.popped_strands.should eq(true)
      record.backing_loss.should eq(false)
      record.delamination.should eq(false)
      record.dirt_dust.should eq(false)
      record.record_cassette_cracks.should eq(false)
      record.stepped_pack.should eq(false)
      record.binder_loss.should eq(false)
      record.edge_curling.should eq(true)
      record.fungus.should eq(false)
      record.record_cassette_delamination.should eq(false)
      record.flange_pack.should eq(false)
      record.blocking.should eq(false)
      record.edge_damage.should eq(false)
      record.liquid.should eq(false)
      record.record_cassette_scratches.should eq(false)
      record.unsecured_tape.should eq(false)
      record.brittleness.should eq(false)
      record.stretching.should eq(false)
      record.pest.should eq(false)
      record.record_cassette_surface_contamination.should eq(false)
      record.heads_out.should eq(false)
      record.breakage.should eq(false)
      record.spoking.should eq(false)
      record.slotted_hub.should eq(true)
      record.record_cassette_warping.should eq(false)
      record.vinegar_odor.should eq(false)
      record.cinching.should eq(true)
      record.windowing.should eq(false)
      record.splices.should eq(false)
      record.other_odor.should eq(false)
      record.cupping.should eq(true)
      record.wrinkling.should eq(false)
      record.condition_notes.should eq("")
      record.notes.should eq("")
    end
    
    it "should import images correctly" do
      FormConnectParser.parse(example_file)
      
      Record.first.images.count.should be(4)
    end
    
    it "should not error out on bad example" do
      expect { FormConnectParser.new(bad_example_file) }.to_not raise_error
      
      Record.count.should be(0)
    end
    
  end

end