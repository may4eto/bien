CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIA4CNFWQNEYOWJ7L44',                        # required unless using use_iam_profile
      aws_secret_access_key: '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',                        # required unless using use_iam_profile
      region:                'eu-central-1',                 
    }
    config.fog_directory  = 'bien-restaurant-reviews'                                     
  end