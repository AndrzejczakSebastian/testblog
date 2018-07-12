Rails.application.routes.draw do
  root 'home#welcome'
  resources :authors
  resources :posts
  resources :comments
  # get '/authors', to: 'authors#index'
  # get '/authors/:id', to: 'authors#show', as: :author
  # get '/author/new', to: 'authors#new', as: :new_author
end
