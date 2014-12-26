# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'isa',
       user:        'deploy',
       roles:       %w{web app db}

set :application, 'gitflow'
set :user, 'deploy'

set :scm, :git
set :repository, 'git@github.com:git-flow/backend.git'
set :branch, 'master'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
