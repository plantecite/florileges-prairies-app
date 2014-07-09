require 'sidekiq/web'

PUrb::Application.routes.draw do
  
  resources :observations

  resources :especes

  resources :sites do
  	resources :gestions
    resources :releves
  end

  resources :sites

  root :to => "home#index"

	get 'menupush', to: 'home#menupush'
  get 'recherche-taxref', to: 'home#/recherche-taxref'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  mount Sidekiq::Web => '/sidekiq'

end