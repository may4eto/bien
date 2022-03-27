CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIA4CNFWQNEQDVBCVX6',                        # required unless using use_iam_profile
      aws_secret_access_key: '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',                        # required unless using use_iam_profile
      region:                'eu-central-1',                 
    }
    config.fog_directory  = 'bien-restaurant-reviews'                                     
  end