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
      @tmp_path = File.dirname(filename)
      @filename = filename
    else
      raise FormConnectParseError
    end

  end


  def self.parse(filename)
    FormConnectParser.new(filename).parse
  end


  def parse
    CSV.new(open(filename), :headers => true).map do |record|
      # build a new record
      record_builder = Record.new

      record.each do |header, field|
        # set all attributes
        case header
        when 'Unnamed Field' # all images
          #Some code to encode images
          image_filename = "#{tmp_path}/#{field}"

          upload_image(image_filename, record_builder)

        else # default
          attribute, value = header.parameterize.underscore.to_sym, field.strip

          record_builder[attribute] = value
        end
      end

      # save
      record_builder.save!
      record_builder
    end

  end


  private

  def upload_image(img_path, record_builder)
    if File.size?(img_path) ## non-zero file size
      File.open(img_path) do |file|
        record_builder.images.build(file: file)
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
