Rails.application.routes.draw do
  root "top#index"
  get "courses" => "courses#index"
  post "courses" => "courses#create"
  get "new_course" => "courses#new"
  get "edit_course/:id" => "courses#edit"
  get "course/:course_id/user/:id" => "courses#show"
  patch "courses/:id" => "courses#update"
  put "courses/:id" => "courses#update"
  delete "courses/:id" => "courses#destroy"
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
    resources :users
   
end
