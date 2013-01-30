load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

# ALS deployment notes:
# We may be able to use the following for auto compiling during capistrano deployments: load 'deploy/assets' 