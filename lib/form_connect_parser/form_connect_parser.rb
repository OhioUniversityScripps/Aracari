require 'csv'

class FormConnectParser
  ACCEPTED_FORMATS = [".csv", ".zip"]
  
  def initialize(filename)
    @filename = filename
    
    raise FormConnectParseError unless File.exists?(@filename)
    raise FormConnectParseError unless ACCEPTED_FORMATS.include?(File.extname(@filename))
  end
  
  def self.parse(filename)
    FormConnectParser.new(filename).parse
  end
    
  def parse
    CSV.new(open(filename), :headers => true).each do |record, index|
      # build a new record
      record_builder = Record.new
            
      record.headers.each do |field|

        # set all attributes        
        case
          when field  == 'Unnamed Field' # all images
            #Some code to encode images
            image_filename = Rails.root + 'spec/support/record_parse' + record[field]
            
            record_builder.images << upload_image(image_filename)
            
          else # default
            attribute, value = field.parameterize.underscore.to_sym, record[field].strip
            
            record_builder[attribute] = value
        end
      end
      
      # save
      record_builder.save!
    end
    
  end
  
  def filename
    if File.extname(@filename) == ".zip"
      unzip!(@filename)
    end
    
    @filename
  end
  
  def dirname
    File.dirname(@filename)
  end
  
  private
  
  def upload_image(img_path)
    if File.exists?(img_path) && File.size(img_path) ## non-zero file size
      File.open(img_path) do |file|
        Image.create(file: file)
      end
    end
  end
  
  def unzip!
    Archive::Zip.extract(@filename, Rails.root + '/tmp/zip')
  end
end

class FormConnectParseError < StandardError
end
