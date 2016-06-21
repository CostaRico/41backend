require 'bundler/capistrano'

# after "deploy:update_code", :copy_database_config
task :copy_database_config, roles => :app do
  db_secrets = "#{shared_path}/secrets.yml"
  db_config =  "#{shared_path}/database.yml"
  run "cp #{db_secrets} #{release_path}/config/secrets.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

# В rails 3 по умолчанию включена функция assets pipelining,
# которая позволяет значительно уменьшить размер статических
# файлов css и js.
# Эта строка автоматически запускает процесс подготовки
# сжатых файлов статики при деплое.
# Если вы не используете assets pipelining в своем проекте,
# или у вас старая версия rails, закомментируйте эту строку.
load 'deploy/assets'

ssh_options[:forward_agent] = true

# Имя вашего проекта в панели управления.
# Не меняйте это значение без необходимости, оно используется дальше.
set :application,     "valera"

# Сервер размещения проекта.
set :deploy_server,   "calcium.locum.ru"

# Не включать в поставку разработческие инструменты и пакеты тестирования.
set :bundle_without,  [:development, :test]

set :user,            "hosting_jenfan"
set :login,           'jenfan'
set :use_sudo,        false
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{user}/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true

# Следующие строки необходимы, т.к. ваш проект использует rvm.
set :rvm_ruby_string, "2.2.2"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"

set :scm,             :git
set :repository,    "https://github.com/jenfan/valera.git"


## --- Ниже этого места ничего менять скорее всего не нужно ---

before 'deploy:finalize_update', 'set_current_release'
task :set_current_release, :roles => :app do
    set :current_release, latest_release
end

  set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"


# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end
