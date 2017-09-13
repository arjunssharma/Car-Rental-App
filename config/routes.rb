Rails.application.routes.draw do

  root 'car_rental#home'
  #get '/home', to: 'car_rental/home'
  get '/help', to: 'car_rental#help'
  get '/about', to:'car_rental#about'
  get  '/signup',  to: 'users#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'users#index'
end
