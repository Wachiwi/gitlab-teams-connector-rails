Rails.application.routes.draw do
  post '/r/:hash', to: 'admin/hooks#redirect'

  namespace :admin do
    resources :hooks
  end

  get '/healthcheck', to: 'common#healthcheck'
  root 'common#welcome'
end
