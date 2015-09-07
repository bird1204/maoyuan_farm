require 'yaml'
CarrierWave.configure do |config|
  # aws = YAML.load_file("#{Rails.root.to_s}/config/aws.yml")
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['ACCESS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],                    # required
    region:                ENV['S3_REGION'],                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = ENV['S3_BUCKET']                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end