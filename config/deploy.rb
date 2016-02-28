lock '3.4.0'

set :application, 'rails5'
set :scm, :git
set :repo_url, 'git@github.com:toshiponnu/rails5.git'
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :ssh_options, {
  user: 'ubuntu',
  keys: [File.expand_path('~/.ssh/xxx.pem')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :deploy_to, '/var/source'
set :keep_releases, 3
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets public/tmp}

set :format, :pretty
set :log_level, :debug
set :pty, true

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all

set :whenever_roles, ->{ :support }
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_environment, ->{ fetch(:stage) }

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web) do
      invoke 'unicorn:restart'
    end
  end

end
