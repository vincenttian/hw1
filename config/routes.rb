Rails.application.routes.draw do
  #get '/about', to: 'CONTROLLER#FUNCTION'
  #get '/user/new', to: 'CONTROLLER#FUNCTION'
  root 'users#index'
  get '/user/new', to: 'users#new', as: 'users'
  get '/user/:id', to: 'users#show', as: 'user'
  post '/user/new', to: 'users#create'
  get '/about', to: 'static_pages#about'
end
