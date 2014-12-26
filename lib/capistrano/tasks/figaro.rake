namespace :figaro do
  desc 'Upload figaro configuration to the shared folder'
  task :setup do
    on roles(:web) do
      upload! 'config/application.yml', "#{shared_path}/application.yml"
    end
  end
end
