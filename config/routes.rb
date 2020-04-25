Rails.application.routes.draw do
  root "top#index"
  get "courses" => "courses#index"
  post "courses" => "courses#create"
  get "courses/new" => "courses#new"
  get "courses/:id/edit" => "courses#edit"
  get "courses/:id" => "courses#show"
  post "courses/:id/update" => "courses#update"
  put "courses/:id" => "courses#update"
  post "courses/:id/destroy" => "courses#destroy"

  
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
    

    resources :users
   
end
