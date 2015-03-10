Clearance.configure do |config|
  config.mailer_sender = 'Git-Flow Registration <hello@gitflow.nl>'
  config.allow_sign_up = Rails.env == 'production' ? false : true
end
