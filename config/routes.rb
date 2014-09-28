Rails.application.routes.draw do
  root 'users#index'
  get '/about', to: 'static_pages#about'
  #get '/user/new', to: 'CONTROLLER#FUNCTION'
  get '/user/:id', to: 'users#show', as: 'user'
  post '/user/new', to: 'users#create'
end
