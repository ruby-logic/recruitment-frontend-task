require 'capistrano/setup'
require 'capistrano/console'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/scm/git'
require 'capistrano-rails'
require 'rvm1/capistrano3'

install_plugin Capistrano::SCM::Git
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
