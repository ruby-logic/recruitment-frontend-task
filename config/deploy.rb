lock '~> 3.10.1'

set :application, 'rubylogic-frontend-task'
set :repo_url, 'git@bitbucket.org:rubylogic/rubylogic-frontend-task.git'

before 'deploy', 'rvm1:install:rvm'
before 'deploy', 'rvm1:install:ruby'
before 'deploy', 'deploy:install_bundler'
after 'deploy', 'deploy:restart_application'

set :linked_files, %w[
  .env
]

set :linked_dirs, %w[
  log
  tmp/pids
  tmp/sockets
]

