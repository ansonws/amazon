Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/", { to: 'home#index', as: 'root'} )

  get('/about', {to: 'home#about'})

  get('/contact', {to: 'contact#index'})
end
