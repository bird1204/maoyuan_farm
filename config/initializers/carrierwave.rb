require 'yaml'
CarrierWave.configure do |config|
  aws = YAML.load_file("#{Rails.root.to_s}/config/aws.yml")
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     aws[:key_id],                        # required
    aws_secret_access_key: aws[:access_key],                    # required
    region:                aws[:s3][:region],                  # optional, defaults to 'us-east-1'
    # host:                  's3.example.com',             # optional, defaults to nil
    # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = aws[:s3][:bucket]                          # required
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end