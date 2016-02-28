require 'action_dispatch/middleware/session/dalli_store'

# Unicornのプロセスがlistenするソケットを指定
listen  '/tmp/unicorn.sock'

# pid fileの位置を指定
pid "tmp/pids/unicorn.pid"

# ワーカーの数を指定
worker_processes 3

# リクエストタイムアウト秒を指定
timeout 10

# ダウンタイムをなくすため、アプリをプレロード
preload_app true

# Unicornのログ出力先を指定
ROOT = File.dirname(File.dirname(__FILE__))
stdout_path "#{ROOT}/log/unicorn-stdout.log"
stderr_path "#{ROOT}/log/unicorn-stderr.log"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{ROOT}/Gemfile"
end

# Unicornのプロセスがフォークする前後の挙動を指定
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
 
  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection

  # ref. http://techracho.bpsinc.jp/baba/2012_08_29/6001
  if defined?(ActiveSupport::Cache::DalliStore) && Rails.cache.is_a?(ActiveSupport::Cache::DalliStore)
    Rails.cache.reset
    ObjectSpace.each_object(ActionDispatch::Session::DalliStore) { |obj| obj.reset }
  end
end
