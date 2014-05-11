PUrb::Application.routes.draw do
  resources :sites

  root :to => "sites#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end