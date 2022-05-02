CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     '<%= Rails.application.credentials.aws[:access_key_id] %>',                        # required unless using use_iam_profile
      aws_secret_access_key: '<%= Rails.application.credentials.aws[:secret_access_key] %>',                        # required unless using use_iam_profile
      region:                'eu-central-1',                 
    }
    config.fog_directory  = 'bien-restaurant-reviews'                                     
  end