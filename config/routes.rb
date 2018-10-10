Rails.application.routes.draw do
  
  get "/" => "home#top"
  
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "users/create" => "users#create"
  post "login" => "users#login"
  get "users/:id" => "users#show"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
