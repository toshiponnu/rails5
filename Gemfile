source 'https://rubygems.org'

gem 'rails', '>= 5.0.0.beta3', '< 5.1'
gem 'puma'
gem 'config'
gem 'aws-sdk', '~> 2'

# backend
gem 'mysql2'
gem 'redis', '~> 3.0'
gem 'dalli'
gem 'annotate'

# frontend
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'kaminari', github: 'amatsuda/kaminari', branch: '0-17-stable'

# asset
gem 'rmagick'
gem 'carrierwave'
gem 'asset_sync'

# auth
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

# cron
gem 'whenever', :require => false

# sitemap
gem 'sitemap_generator'

group :development, :test do
  gem 'byebug'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '~> 3.0'
  gem 'spring'
  gem 'bullet'
  gem 'mailcatcher'
end

group :production do
  gem 'unicorn'
  gem 'newrelic_rpm'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
