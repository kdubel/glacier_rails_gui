# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "GlacierGUI"
set :repo_url, "https://github.com/kdubel/glacier_rails_gui"


set :deploy_to, "/srv/http/glacier_gui"

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :rvm_type, :system
set :rvm_ruby_version, '2.5.1'