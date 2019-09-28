namespace :deploy do
  task :create_database do
    on roles(:db) do
      within File.join(fetch(:deploy_to),
        'releases',
        capture("ls #{File.join(fetch(:deploy_to), 'releases')}").split("\n").sort.last) do
        with rails_env: fetch(:rails_env) do
          execute :rake, :'db:create'
        end
      end
    end
  end
end
