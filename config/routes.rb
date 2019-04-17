Rails.application.routes.draw do

  get "/", { to: 'home#index', as: 'root' }  
  get '/about', { to: 'home#about' } 

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :contact, only: [:new, :create]
  resources :products do
    resources :reviews, only: [:create, :destroy]
  end

end
