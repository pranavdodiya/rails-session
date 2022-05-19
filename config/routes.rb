Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'products#index'

  resources :products

  get 'addto_cart/:id', to: "products#addto_cart" , as: "add_cart"
  get 'show_cart/:id', to: "products#show_cart", as: "show_cart"

  get 'delete_cart/:id', to: "products#delete_cart" , as: "delete_cart"
  


end
