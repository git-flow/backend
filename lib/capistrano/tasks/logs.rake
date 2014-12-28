namespace :logs do
  desc 'Tail Rails logs'
  task :rails do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end

  desc 'Tail Nginx access logs'
  task :nginx_access do
    on roles(:app) do
      sudo 'tail -f /var/log/nginx/access.log'
    end
  end

  desc 'Tail Nginx error logs'
  task :nginx_error do
    on roles(:app) do
      sudo 'tail -f /var/log/nginx/error.log'
    end
  end
end
