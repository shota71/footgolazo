Rails.application.routes.draw do
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"

  get "/" => "posts#index"
  get "/about" => "home#about"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  resources :posts do
    collection do
      get "search"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
