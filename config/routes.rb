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

  get  '/new_superadmin',  to: 'users#newsuperadmin'
  post '/new_superadmin',  to: 'users#createsuperadmin'

  get  '/bookings',  to: 'bookings#newbooking'
  post '/bookings',  to: 'bookings#create_booking'

  get  '/cars',  to: 'cars#index'
  post '/cars',  to: 'cars#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'show_admin', to: 'users#show_admin', as: :show_admin, via: :all
  match '/users/newadmin', to: 'users#newadmin', as: :newadmin, via: :all

  get 'show_superadmin', to: 'users#show_superadmin', as: :show_superadmin, via: :all
  match '/users/newsuperadmin', to: 'users#newsuperadmin', as: :newsuperadmin, via: :all

  #match '/users/newuser', to: 'users#newuser', as: :new_user, via: :all
  resources :users
  resources :cars
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'users#index'
end
