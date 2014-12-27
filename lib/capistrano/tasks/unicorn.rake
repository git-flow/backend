namespace :unicorn do
  %w(start stop reload restart).each do |command|
    desc "#{command.capitalize} unicorn server"
    task command do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "service unicorn_#{fetch(:application)} #{command}"
      end
    end
  end
  after 'deploy:publishing', 'unicorn:reload'

  desc 'Set-up Unicorn on server'
  task :setup do
    on roles(:app), in: :parallel do
      sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
      sudo "chmod +x /etc/init.d/unicorn_#{fetch(:application)}"
    end
  end
end
