PUrb::Application.routes.draw do
  
  resources :sites do
  	resources :gestions
  end

  resources :sites

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end