namespace :dotenv do
  desc 'Syncs the local .env to the server.'
  task :setup do
    on roles(:app) do
      upload! '.env', "#{shared_path}/.env"
    end
  end
  before 'deploy:published', 'dotenv:setup'
end
