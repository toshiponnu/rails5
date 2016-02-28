set :stage, :test
set :rails_env, :test

role :app, ENV['DOMAIN_TEST']
role :support, ENV['DOMAIN_TEST']
role :web, ENV['DOMAIN_TEST'] # assets precompile, unicorn
role :db, ENV['DOMAIN_TEST'], primary: true # db migrate
