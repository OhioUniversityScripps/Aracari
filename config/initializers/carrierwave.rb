if defined?(CarrierWave)
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/tmp/uploads/#{model.class.to_s.underscore}/"
      end 
               
      def store_dir
        "#{Rails.root}/uploads/#{Rails.env}/#{model.class.to_s.underscore}/"
      end
    end
  end
end