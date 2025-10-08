Rails.application.routes.draw do
  resources :usuarios
  resources :autores
  resources :avaliacoes
  resources :musica
  resources :seguidas
  resources :curtidas
  post "/login", to: "usuarios#login"


  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
