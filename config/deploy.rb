# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'gitflow'
set :repo_url, 'git@github.com:git-flow/backend.git'

set :linked_files, %w(.env)

# RVM
set :rvm_type, :auto
set :rvm_ruby_version, 'default'
set :rvm_custom_path, '~/.rvm'

# Bundler
set :bundle_path, nil
set :bundle_binstubs, nil
set :bundle_flags, '--system'
