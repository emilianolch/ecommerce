Rails.application.routes.draw do
  post 'payments/create'
  get 'payments/success'
  get 'payments/pending'
  get 'payments/failure'
  post 'payments/notification'
  get 'cart/index'
  post 'cart/add'
  post 'cart/remove'
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
end
