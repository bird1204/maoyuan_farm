require 'yaml'
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['ACCESS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],                    # required
    region:                ENV['S3_REGION'],                  # optional, defaults to 'us-east-1'
    # host:                  ENV['S3_HOST'],             # optional, defaults to nil
    # endpoint:              ENV['S3_END_POINT'] # optional, defaults to nil
  }
  config.fog_directory  = ENV['S3_BUCKET']                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end