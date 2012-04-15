default_run_options[:pty] = true

# Set Rails environment test, development, production
set :rails_env, :development

# Set Domain and Repository Configurations
set :user, "lee"
set :domain, "coastalcommunicationconsultants.com"
set :application, "CoastalCommunicationConsultants"
set :repository,  "git@github.com:leestubbs/Coastal-Communication-Consultants.git"
set :deploy_to, "/var/www/ccc/sandbox/"

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
   desc "Cause Passenger to restart applicaton."
   task :restart do
     run "touch #{current_path}/tmp/restart.txt'"
   end
 end

# Set branch to checkout during deployment
set :branch, "master"

# Do not perform a full checkout everytime we deploy
set :deploy_via, :remote_cache

# Turn on verbose mode for software configuration management
set :scm_verbose, true




