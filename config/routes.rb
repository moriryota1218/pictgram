Rails.application.routes.draw do

  post '/comments/create', to: 'comments#create'

  resources :users
  resources :topics
  resources :comments, only: [:new, :create, :topic_id, :index]

  root 'pages#index'
  get 'pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'

end
