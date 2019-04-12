Rails.application.routes.draw do

  get "/", { to: 'home#index', as: 'root' }  
  get '/about', { to: 'home#about' } 
  
  resources :contact, only: [:new, :create]
  resources :products

end
