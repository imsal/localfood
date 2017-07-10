Rails.application.routes.draw do

  devise_for :users#, :controllers => { registrations: 'registrations' }

  get '/profile', to:'users#show', as: 'profile'

  resources :charges, only: [:new, :create]
  get 'thanks', to: 'charges#thanks', as: 'thanks'

  get 'store/index'

  resources :line_items
  resources :carts
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  #
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'

  resources :products

  root 'static_pages#landing_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
