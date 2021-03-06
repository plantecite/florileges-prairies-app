require "sidekiq/web"

FlorilegesPrairies::Application.routes.draw do
  resources :woods

  resources :observations

  resources :taxa, defaults: {format: :json}

  resources :sites do
    member do
      patch :export
      put :export
      post :export
    end
    resources :gestions
    resources :releves
  end

  post "export" => "sites#export", as: :export
  post "admin_export" => "admin/actions#admin_export", as: :admin_export

  resources :sites

  get "tous-les-sites", to: "sites#all"

  root :to => "home#index"

  get "menupush", to: "home#menupush"
  get "recherche-taxref", to: "home#/recherche-taxref"

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

  namespace :admin do
    resources :users, only: :show do
      post :generate_new_password_email
    end
    resources :actions, only: :index
  end

  mount Sidekiq::Web => "/sidekiq"
end
