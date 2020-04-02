Rails.application.routes.draw do
  get "travels/show/:id" => "travels#show"
end
