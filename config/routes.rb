Rails.application.routes.draw do
  devise_for :users

  root to: 'site#index'

  post 'request-invite', to: 'site#request_invite'
end
