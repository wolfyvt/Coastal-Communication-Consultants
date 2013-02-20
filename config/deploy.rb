# ALS deployment notes:
# For production pre compilation of assets use the following from the root project directory (may need to run as www-data for permissions):
# bundle exec rake assets:precompile

desc "Starting deployment..."

# This is often needed to ask for passwords...
default_run_options[:pty] = true

# Use agent forwarding to use local github keys
ssh_options[:forward_agent] = true

# Set Rails environment test, development, production
set :rails_env, :production

# Set domain user name (not sure how to ask during deployment)
set :user, "lee"
#set :user, "adam"

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
  
   desc "Backing up production database."
   t=Time.now
   run "cp /var/www/ccc/db/production.sqlite3 /var/www/ccc/db/backup/#{t.year}-#{t.month}-#{t.day}_#{t.hour}:#{t.min}:#{t.sec}_db.sqlite3"
  
#   desc "Create symbolic link to production database."
#   run "ln -s /var/www/ccc/db/production.sqlite3 production.sqlite3"
   
#   desc "Updating owner and permissions."
#   run "chown www-data:www-data -R /var/www/ccc"
#   run "chmod 755 -R /var/www/ccc"
  
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

