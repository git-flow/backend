# If we are in production, we need a database password.
Figaro.require_keys('GITFLOW_DATABASE_PASSWORD') if Rails.env == 'production'
