namespace :nginx do
  %w(start stop restart reload).each do |task|
    desc "#{task.capitalize} Nginx service"
    task task do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "service nginx #{task}"
      end
    end
  end
end
