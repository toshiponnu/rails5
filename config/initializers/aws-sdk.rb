Aws.config.update({
  region: Settings.aws.region,
  credentials: Aws::Credentials.new(
    Settings.aws.app_key,
    Settings.aws.app_secret
  ),
  ses: { region: 'us-east-1' }
})
