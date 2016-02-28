set :stage, :production
set :rails_env, :production

role :app, ENV['DOMAIN_APP']
role :support, ENV['DOMAIN_SUPPORT']
role :web, ENV['DOMAIN_WEB'] # assets precompile, unicorn
role :db, ENV['DOMAIN_DB'], primary: true # db migrate
