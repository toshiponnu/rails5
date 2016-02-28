if Rails.env.production? && defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.aws_access_key_id = Settings.aws.app_key
    config.aws_secret_access_key = Settings.aws.app_secret
    config.fog_region = Settings.aws.region
    config.fog_directory = Settings.aws.s3_bucket
    config.gzip_compression = true
  end
end
