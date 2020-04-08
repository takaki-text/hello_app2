Rails.application.routes.draw do
 
  
 
  
  get"top/index" => "top#index"
  get 'home/index'
  devise_for :users
end
