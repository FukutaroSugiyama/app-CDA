Rails.application.routes.draw do
  
  get "/" => "home#top"
  
  get "signup" => "users#new"
  get "login" => "users#login_form"
  post "users/create" => "users#create"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "users/:id" => "users#show"
  
  get "posts/total" => "posts#total"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
