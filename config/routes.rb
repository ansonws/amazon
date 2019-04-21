Rails.application.routes.draw do
  get '/', { to: "home#index", as: "root" }
  get '/about', to: "about#index"
  resources :contacts, only: [:index, :new, :create]
  resources :products do
    resources :reviews, only: [:create, :destroy]
  end
  get '/signup', to: "users#new"
  post '/users', to: "users#create"
  resource :session, only: [ :create, :destroy]
  get '/login', to: "sessions#new"
end
