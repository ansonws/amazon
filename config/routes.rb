Rails.application.routes.draw do
  get '/', { to: "home#index", as: "root" }
  get '/about', to: "about#index"
  resources :contacts, only: [:index, :new, :create]
  resources :products
end
