Rails.application.routes.draw do
  post '/r/:hash', to: 'admin/hooks#redirect'

  get '/admin', to: 'admin#index'

  namespace :admin do
    resources :hooks
  end

  get '/healthcheck', to: 'common#healthcheck'
  root 'common#welcome'
end
