namespace :unicorn do
  %w(start stop restart).each do |command|
    desc "#{command.capitalize} unicorn server"
    task command do
      on roles(:app), in: :sequence, wait: 5 do
        run "/etc/init.d/unicorn_#{application} #{command}"
      end
    end
  end

  desc 'Set-up Unicorn on server'
  task :setup do
    on roles(:app), in: :parallel do
      sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    end
  end
  # after 'deploy:setup_config', 'unicorn:setup'
end
