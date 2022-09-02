Rails.application.routes.draw do
  post "/users" => "users#create", default: { format: :json }
  post "/sessions" => "sessions#create", default: { format: :json }

  resources :trips, defaults: { format: :json }
  resources :places, defaults: { format: :json }
  resources :user_trips, defaults: { format: :json }
end
