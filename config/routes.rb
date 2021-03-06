Rails.application.routes.draw do
  
 
  
  
  get 'posts/create'
  get 'posts/destroy'
  root "top#index"
  resources :follows, only: [:create, :destroy]

  get "courses" => "courses#index"
  post "courses" => "courses#create"
  get "courses/new" => "courses#new"
  get "courses/:id/edit" => "courses#edit"
  get "courses/:id" => "courses#show"
  post "courses/:id/update" => "courses#update"
  put "courses/:id" => "courses#update"
  post "courses/:id/destroy" => "courses#destroy"
  
  get "demands" => "demands#index"
  post "demands" => "demands#create"
  get "demands/new" => "demands#new"
  get "demands/:id/edit" => "demands#edit"
  get "demands/:id" => "demands#show"
  post "demands/:id/update" => "demands#update"
  put "demands/:id" => "demands#update"
  post "demands/:id/destroy" => "demands#destroy"
  
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]
  resources :notifications, :only => [:index, :destroy]
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
    

    resources :users do
      member do
       get :following, :followers, :show2
      end
    end
   
   
end
