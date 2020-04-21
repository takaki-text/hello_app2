Rails.application.routes.draw do
  get 'users/index'
  get"top/index" => "top#index"
  get 'home/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'}
    resources :users, only: [:show]
end
