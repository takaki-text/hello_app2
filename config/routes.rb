Rails.application.routes.draw do
 
  
 
  resources :users, only: [:show]
  get 'users/index'
  get"top/index" => "top#index"
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
end
