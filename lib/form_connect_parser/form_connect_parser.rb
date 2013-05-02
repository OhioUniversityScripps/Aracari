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
    CSV.new(open(filename), :headers => true).each do |record|
      # build a new record
      record_builder = Record.new
            
      record.headers.each do |field|
        # set all attributes        
        case
          when field  == 'Unnamed Field' # all images
            #Some code to encode images
            # record_builder.build(:image)
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
    @filename
  end
end

class FormConnectParseError < StandardError
end
