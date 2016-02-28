CarrierWave.configure do |config|
  config.asset_host = "#{Settings.protocol}#{Settings.domain_asset}" if Rails.env.production?
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Settings.aws.app_key,
    :aws_secret_access_key  => Settings.aws.app_secret,
    :region                 => Settings.aws.region
  }
  config.fog_directory = Settings.aws.s3_bucket
end
