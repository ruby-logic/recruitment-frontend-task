namespace :deploy do
  task :install_bundler do
    on roles(:app) do
      within File.join(fetch(:deploy_to),
        'releases',
        capture("ls #{File.join(fetch(:deploy_to), 'releases')}").split("\n").sort.last) do
        execute :rvm, :'.', :do, :gem, :install, :bundler
      end
    end
  end
end
