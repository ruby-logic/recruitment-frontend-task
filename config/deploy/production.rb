set :stage, :production

server 'ov2.rubylogic.eu:18022', user: 'apps', roles: %w[app web db]

# Initial Values
# ===============

set :migration_servers, -> { release_roles(fetch(:migration_role)) }

set :app_name, 'rubylogic-frontend-task'
set :rails_env, 'production'
set :branch, 'master'
set :application, "#{fetch(:app_name)}_#{fetch(:rails_env)}"
set :deploy_to, "/var/www/#{fetch(:application)}"
