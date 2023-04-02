# config valid for current version and patch releases of Capistrano
#lock "~> 3.17.2"

#set :application, "my_app_name"
#set :repo_url, "git@example.com:me/my_repo.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for li:nked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


# capistranoのバージョン固定
lock "~> 3.17.2"

#set :assets_roles, [:web]

set :unicorn_pid, "#{shared_path}/tmp/pids/unicorn.pid"


# デプロイするアプリケーション名
set :application, "Moglog"

# cloneするgitのレポジトリ
# 1-3で設定したリモートリポジトリのurl
set :repo_url, 'git@github.com:yoshioka-chihiro/conoha_moglog.git'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'main'

# deploy先のディレクトリ。
set :deploy_to, "/var/www/Moglog"

# シンボリックリンクをはるファイル
set :linked_files, fetch(:linked_files, []).push('config/secrets.yml')

# シンボリックリンクをはるフォルダ
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# rubyのバージョン
# rbenvで設定したサーバー側のrubyのバージョン
set :rbenv_ruby, '3.1.2'
set :rbenv_type, :system
set :rbnav_path, '/home/newuser/.rbenv/versions/3.1.2/bin/ruby'

set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all


# 出力するログのレベル。
set :log_level, :debug

# デプロイのタスク

namespace :deploy do

  # unicornの再起動
  desc 'Restart application'

  task :restart do
    invoke 'unicorn:restart'
  end

  # データベースの作成
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
                  # データベース作成のsqlセット
                # データベース名はdatabase.ymlに設定した名前で
                  sql = "CREATE DATABASE IF NOT EXISTS moglog_production;"
                  # クエリの実行。
                # userとpasswordはmysqlの設定に合わせて
                execute "mysql --user=root --password=Hiroki1109! -e '#{sql}'"

        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end

set :default_env, {
  rbenv_root: "/home/user/.rbenv",
  path: "/home/user/.rbenv/bin:$PATH",
  region: ENV["S3_REGION"],
  aws_access_key_id: ENV["S3_ACCESS_KEY"],
  aws_secret_access_key: ENV["S3_SECRET_KEY"]
}
