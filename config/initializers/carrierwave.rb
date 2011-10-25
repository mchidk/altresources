unless Rails.env.development?
  CarrierWave.configure do |config|
    config.storage        = :fog
    config.fog_directory  = 'e9-staging'
    config.fog_host       = 'https://e9-staging.s3.amazonaws.com'   # optional, defaults to nil
    config.fog_public     = true                                    # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end

  #
  # Excon throws a 404 exception which is never caught if the file doesn't exist
  # in the cloud.  Not sure how to properly handle this, but I think it's safe
  # to say that breaking the whole app is not the answer.
  #
  # This module simply rescues from super and returns the default_url specified
  # on the class (or nil if there isn't one).
  #
  module ExconUrlRescue
    def url(*args)
      super rescue default_url
    end

    alias :to_s :url
  end

  CarrierWave::Uploader::Base.send(:include, ExconUrlRescue)


  require 'carrierwave/storage/fog'

  class CarrierWave::Storage::Fog::File
    def delete
      file.destroy rescue nil
    end
  end
end
