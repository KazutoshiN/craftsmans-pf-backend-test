# Unicorn設定ファイル
# 次のURLのサンプルをベースにしている。
# http://unicorn.bogomips.org/examples/unicorn.conf.rb

# 専用サーバーであればコアにつき1個以上を指定する。
worker_processes 2

# リクエスト待ち受け口、TCPとUNIXドメインとが指定可能。
# listen "/var/lib/redmine/tmp/sockets/redmine.sock", :backlog => 32
listen '/var/lib/analysis/unicorn.sock', backlog: 32
# listen 8282, :tcp_nopush => true

# タイムアウト秒数
timeout 30

# 稼働中のプロセスのPIDを書いておくファイル。
# pid "/var/lib/redmine/tmp/pids/redmine.pid"
pid '/home/vagrant/analysis/tmp/pids/unicorn.pid'

# デーモンで起動すると標準出力／標準エラー出力が/dev/nullになるので、
# それぞれログファイルに出力する。
# /var/logで一元管理する場合はフルパスで記載、その場合は/var/log配下にunicornディレクトリを作っておく。
# stderr_path '/var/log/unicorn/unicorn.stderr.log'
# stdout_path '/var/log/unicorn/unicorn.stdout.log'
stderr_path 'log/unicorn.stderr.log'
stdout_path 'log/unicorn.stdout.log'

# マスタープロセス起動時にアプリケーションをロードする(true時)。
# ワーカープロセス側でロードをしないのでメモリ消費、応答性良好になる。
# ただし、ソケットはfork後に開きなおす必要あり。
# HUPシグナルでアプリケーションはロードされない。
preload_app true

# unicornと同一ホスト上のクライアントとのコネクション限定で、維持されているかを
# アプリケーションを呼ぶ前にチェックする。
check_client_connection false

before_fork do |_server, _worker|
  # Railsでpreload_appをtrueにしているときは強く推奨
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |_server, worker|
  # Railsでpreload_appをtrueにしているときは必須
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection

  begin
    uid = Process.euid
    gid = Process.egid
    # user, group = "redmine", "redmine"
    # ENV["HOME"] = "/home/redmine"
    target_uid = Etc.getpwnam(user).uid
    target_gid = Etc.getgrnam(group).gid
    worker.tmp.chown(target_uid, target_gid)
    if (uid != target_uid) || (gid != target.gid)
      Process.initgroups(user, target_gid)
      Process::GID.change_privilege(target_gid)
      Process::UID.change_privilege(target_uid)
    end
  rescue StandardError
    STDERR.puts 'could not change user, oh well'
    raise 0 if RAILS_ENV != 'development'
  end
end
