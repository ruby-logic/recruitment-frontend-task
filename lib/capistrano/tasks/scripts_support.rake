namespace :deploy do
  task :restart_application do
    on roles(:app) do
      execute ". ~/scripts/load.sh && kill_project_completely #{fetch(:application)} \
      && start_project_completely #{fetch(:application)} || start_project_completely #{fetch(:application)}"
    end
  end
  task :stop_application do
    on roles(:app) do
      execute ". ~/scripts/load.sh && kill_project #{fetch(:application)}"
    end
  end
end
