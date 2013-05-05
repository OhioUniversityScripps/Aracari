require 'csv'

class FormConnectParser
  attr_accessor :import_id, :filename, :tmp_path

  def initialize(filename)
    raise FormConnectParseError unless File.exists?(filename)

    case File.extname(filename)
    when '.zip'
      generate_tmp_path
      unzip!(filename)
      @filename = Dir["#{tmp_path}*.csv"].first
    when '.csv'
      @filename = filename
    else
      raise FormConnectParseError
    end

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


  private

  def upload_image(img_path)
    if File.exists?(img_path) && File.size(img_path) ## non-zero file size
      File.open(img_path) do |file|
        Image.create(file: file)
      end
    end
  end

  def unzip!(filename)
    `unzip -o '#{filename}' -d #{tmp_path}`
  end

  def generate_tmp_path
    @import_id = SecureRandom.hex
    @tmp_path = "#{Rails.root}/tmp/zip/#{import_id}/"
    FileUtils.mkdir_p(@tmp_path)
  end

  def copy_upload(path)
    FileUtils.cp(path, tmp_path)
  end

end

class FormConnectParseError < StandardError
end
