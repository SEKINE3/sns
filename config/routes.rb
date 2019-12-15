Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'posts#index'
  get 'post/search' => 'posts#search'

  resources :users
  resources :posts
  resources :comments
  resources :relationships, only:[:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :contacts, only: [:show, :create, :update]
end


