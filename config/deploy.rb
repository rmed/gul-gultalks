require 'bundler/capistrano'
set :application, "gul-talks"

set :scm, :none
set :repository, "."
set :deploy_via, :copy

set :deploy_to, "/home/gultalks/test"

set :use_sudo, false


set :user, "gultalks"

role :web, "163.117.156.71"                         # Your HTTP server, Apache/etc
role :db, "163.117.156.71", :primary=> true


after "deploy", "deploy:migrate"
after "deploy", "deploy:restart" 

namespace :deploy do
    task :restart, :roles => :web do
        run "touch #{deploy_to}/current/tmp/restart.txt"
    end
end
