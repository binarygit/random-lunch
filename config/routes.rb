Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'

  get '/signup', to: 'employees#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :employees
  resources :lunches, only: [:show]
  get 'upcoming_lunch', to: 'lunches#show'
end
