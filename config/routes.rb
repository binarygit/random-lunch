Rails.application.routes.draw do
  root 'static_pages#home'
  get '/signup', to: 'employees#new'
  resources :employees
  get '/home', to: 'static_pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
