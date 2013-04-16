class FormConnectParser
  ACCEPTED_FORMATS = [".xml", ".zip"]
  
  def initialize(filename)
    @filename = filename
    
    raise FormConnectParseError unless File.exists?(@filename)
    raise FormConnectParseError unless ACCEPTED_FORMATS.include?(File.extname(@filename))
  end
  
  def self.parse(filename)
    FormConnectParser.new(filename).parse
  end
    
  def parse
    
    doc = Nokogiri.XML(xml)
    
    # loop through each record
    doc.xpath('//record').each do |record|
      # build a new record
      record_builder = Record.new
            
      record.xpath('///field').each do |field|
        # set all attributes        
        case
          when field  == 'Unnamed Field' # all images
            #Some code to encode images
            record_builder.build(:image)
          else # default
            attribute, value = field[:name].parameterize.underscore.to_sym, field.text.strip
            
            record_builder[attribute] = value
        end
      end
      
      # save
      record_builder.save!
      # binding.pry
    end
    
  end
  
  def unzip!
    
  end
end

class FormConnectParseError < StandardError
end