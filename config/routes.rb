Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  
  resources :users
  resources :books
  
  post "/users/:id" => "books#create"
  get "/homes/about" => "homes#about"
  get "/devise/registrations/new" => "homes#signup"
  get "/devise/sessions/new" => "homes#login"
end
