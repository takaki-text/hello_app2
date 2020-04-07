Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root "home#index"
  get"home/top" => "home#top"

end
