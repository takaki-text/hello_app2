Rails.application.routes.draw do
  root "top#index"
  get "courses" => "courses#index"
  post "courses" => "courses#create"
  get "new_course" => "courses#new"
  get "course/:id/edit" => "courses#edit"
  get "course/:id" => "courses#show"
  post "courses/:id/update" => "courses#update"
  put "courses/:id" => "courses#update"
  post "courses/:id/destroy" => "courses#destroy"

  
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
    resources :courses, only:[:show, :index]

    resources :users
   
end
