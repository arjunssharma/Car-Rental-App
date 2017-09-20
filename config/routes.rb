Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  root 'car_rental#home'
  get '/help', to: 'car_rental#help'
  get '/about', to:'car_rental#about'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get  '/new_user',  to: 'users#newuser'
  post '/new_user',  to: 'users#createuser'

  get  '/new_admin',  to: 'users#newadmin'
  post '/new_admin',  to: 'users#createadmin'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'show_admin', to: 'users#show_admin', as: :show_admin, via: :all
  match '/users/newadmin', to: 'users#newadmin', as: :newadmin, via: :all
  #match '/users/newuser', to: 'users#newuser', as: :new_user, via: :all
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'users#index'
end
