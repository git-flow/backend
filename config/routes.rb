Rails.application.routes.draw do
  root to: 'site#index'

  post 'request-invite', to: 'site#request_invite'
  get 'thank-you', to: 'site#thank_you', as: :thank_you

  resources :template do
    member do
      post 'render', to: 'template#render_template'
    end
  end

  get 'terms', to: 'site#terms'
  get 'privacy', to: 'site#privacy'
end
