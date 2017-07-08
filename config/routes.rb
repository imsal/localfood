Rails.application.routes.draw do

  # get 'charges/new'
  #
  # get 'charges/create'

  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  # devise_for :users

  get 'store/index'

  resources :line_items
  resources :carts
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

  resources :products

  root 'static_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
