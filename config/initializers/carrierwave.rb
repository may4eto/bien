CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),                        # required unless using use_iam_profile
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),                        # required unless using use_iam_profile
      region:                'eu-central-1',                 
    }
    config.fog_directory  = 'bien-restaurant-reviews'                                     
end

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :region                => 'eu-central-1'
    }
    config.fog_directory     =  'bien-restaurant-reviews'
  end
end
