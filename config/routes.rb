Rails.application.routes.draw do
  devise_for :users,
             path:       '/',
             path_names: {
               sign_in:      'login',
               sign_out:     'logout',
               password:     'recovery',
               confirmation: 'verification',
               edit:         'profile/edit',
               registration: 'sign-up'
             }

  root to: 'site#index'

  post 'request-invite', to: 'site#request_invite'
  get 'thank-you', to: 'site#thank_you', as: :thank_you

  get 'terms', to: 'site#terms'
  get 'privacy', to: 'site#privacy'
end
