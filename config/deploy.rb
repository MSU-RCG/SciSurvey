#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require "bundler/capistrano"
require 'capistrano-unicorn'

set :application, "rescomp"
set :bundle_cmd,      "bundle"
set :scm, :git
set :repository,  "https://github.com/MSU-RCG/SciSurvey.git"
set :shell, "/bin/bash"
set :use_sudo,    false
set :deploy_via, :remote_cache
set :copy_exclude, [".git"]
set :user, "rails"
set :deploy_to, "/var/rails"
set :unicorn_env, "Production"
set :unicorn_user, "rails"


desc "Setup Production Settings"
task :production do

  set :branch, "unicorn"
  role :web, "rescomp.rcg.montana.edu"
  role :app, "rescomp.rcg.montana.edu"
  role :db,  "rescomp.rcg.montana.edu", :primary => true

end


namespace :deploy do

  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
 
end

namespace :rcg_unicorn do
  
  desc "Start Unicorn"
   task :start do
     run "cd #{current_release}; RAILS_ENV=production bundle exec unicorn_rails -c #{current_release}/config/unicorn.rb -D"
   end

   desc "Stop unicorn"
   task :stop, :except => { :no_release => true } do
     run "kill -s QUIT `cat #{deploy_to}/#{shared_dir}/pids/unicorn.pid`"
   end
   
end

namespace :db do
  desc "Seed initial data"
  task :seed, :roles => :app do
    run "bash -c 'cd #{current_path} && RAILS_ENV=production rake db:seed'"
  end

  desc  "Clear out test data"
  task :clear, :roles => :app do
    run "bash -c 'cd #{current_path} && bundle exec rake db:drop:all'"
  end

  task :symlink do
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{deploy_to}/#{shared_dir}/config/unicorn.rb #{release_path}/config/unicorn.rb"
  end
  
  desc "Get the remote database and save it locally"
  task :get_remote_database do
    db.run_backup_task
    db.download_backup_files
  end
  
  task :download_backup_files do
    download("#{current_path}/db/backup/", "db/backup/", :recursive => true)
  end
  
  task :run_backup_task do
    run "cd #{current_path}; bundle exec rake yogo:db:backup RAILS_ENV=production"
  end
  
  task :auto_upgrade do
    run "cd #{current_path}; bundle exec rake yogo:db:auto_upgrade RAILS_ENV=production"
  end
end


namespace :assets do
  task :setup do
    run "mkdir -p #{deploy_to}/#{shared_dir}/assets/files"
    run "mkdir -p #{deploy_to}/#{shared_dir}/assets/images"
    run "mkdir -p #{deploy_to}/#{shared_dir}/assets/temp_data"
    run "mkdir -p #{deploy_to}/#{shared_dir}/assets/data"
  end

  task :symlink do
    run "ln -nfs #{deploy_to}/#{shared_dir}/assets/files #{release_path}/public/files"
    run "ln -nfs #{deploy_to}/#{shared_dir}/assets/images #{release_path}/public/images"
    run "ln -nfs #{deploy_to}/#{shared_dir}/assets/temp_data #{release_path}/temp_data"
    run "ln -nfs #{deploy_to}/#{shared_dir}/assets/data #{release_path}/data"

  end
  task :compile do
    run "cd #{current_path}; RAILS_ENV=production bundle exec rake assets:precompile:all"
  end
end

##
# Rake helper task.
# http://pastie.org/255489
# http://geminstallthat.wordpress.com/2008/01/27/rake-tasks-through-capistrano/
# http://ananelson.com/said/on/2007/12/30/remote-rake-tasks-with-capistrano/
def run_remote_rake(rake_cmd)
  rake_args = ENV['RAKE_ARGS'].to_s.split(',')
  cmd = "cd #{fetch(:latest_release)} && #{fetch(:rake, "rake")} RAILS_ENV=#{fetch(:rails_env, "production")} #{rake_cmd}"
  cmd += "['#{rake_args.join("','")}']" unless rake_args.empty?
  run cmd
  set :rakefile, nil if exists?(:rakefile)
end




# These are one time setup steps
after "deploy:setup",       "assets:setup"

# This happens every deploy
after "deploy:update_code", "db:symlink"
after "deploy:update_code", "assets:symlink"
#after "deploy:update_code", "assets:compile"

#after "deploy:restart", "rcg_unicornstart"
#after "rcg_unicorn:stop", "rcg_unicorn:start"