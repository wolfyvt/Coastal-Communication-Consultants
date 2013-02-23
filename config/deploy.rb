# This is often needed to ask for passwords...
default_run_options[:pty] = true

# Use agent forwarding to use local github keys
ssh_options[:forward_agent] = true

# Set Rails environment test, development, production
set :rails_env, :production

# Set domain user name
# Must add deployment .pub keys to /var/www/.ssh authorized_keys
set :user, "www-data"

# Set Domain and Repository Configurations
set :domain, "coastalcommunicationconsultants.com"
set :application, "CoastalCommunicationConsultants"
set :repository,  "git@github.com:wolfyvt/Coastal-Communication-Consultants.git"
set :deploy_to, "/var/www/ccc/"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, domain # Your HTTP server, Apache/etc
role :app, domain # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts



namespace :deploy do
  
  desc "Backs up production db."
  task :backup_sqlite3_db do
    puts "Backing up production database."
    t=Time.now
    run "cp #{deploy_to}db/production.sqlite3 #{deploy_to}db/backup/#{t.year}-#{t.month}-#{t.day}_#{t.hour}:#{t.min}:#{t.sec}_db.sqlite3"
  end
  
  desc "Creates symbolic link for production db."
  task :create_db_symlink do
    puts "Create symbolic link for production sqlite3 database."
    run "ln -s #{deploy_to}db/production.sqlite3 #{deploy_to}current/db/production.sqlite3"
  end
  
  desc "Precompiles all assets for project."
  task :precompile_assets do
    puts "Pre-compiling assets for #{deploy_to}current..."
    run "cd #{deploy_to}current; bundle exec rake assets:precompile"
  end
        
   desc "Cause Passenger to restart applicaton."
   task :restart do
     run "touch #{deploy_to}current/tmp/restart.txt"
   end
 end

# Set branch to checkout during deployment
set :branch, "master"

# Do not perform a full checkout everytime we deploy
set :deploy_via, :remote_cache

# Turn on verbose mode for software configuration management
set :scm_verbose, true

# Setup task execution steps
before "deploy:update", "deploy:backup_sqlite3_db"
after  "deploy:create_symlink", "deploy:create_db_symlink"
before "deploy:restart", "deploy:precompile_assets"

