require 'sidekiq/web'

FlorilegesPrairies::Application.routes.draw do
  
  resources :woods

  resources :observations

  resources :especes

  resources :sites do
  	resources :gestions
    resources :releves
  end

  resources :sites

  get 'tous-les-sites', to: 'sites#all'

  root :to => "home#index"

	get 'menupush', to: 'home#menupush'
  get 'recherche-taxref', to: 'home#/recherche-taxref'

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  namespace :admin do  
    resources :users, only: :show do
       post :generate_new_password_email
    end
 end

  mount Sidekiq::Web => '/sidekiq'

end