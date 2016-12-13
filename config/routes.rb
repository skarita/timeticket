Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :listings, :reservations

  namespace :api do
    resources :users, :listings, :reservations
  end

  get '/session/new', to: 'session#new'
  post '/session', to: 'session#create'
  delete '/session', to: 'session#destroy'

  get '/', to: 'users#home'

end
