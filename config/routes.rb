Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  get '/popular_cities', to: 'static_pages#popular_cities'#, as: 'popular_cities'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
