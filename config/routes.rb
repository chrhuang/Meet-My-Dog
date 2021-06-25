Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/join/:id", to: "events#join", as: "join"
  resources :sites, only: [:index, :show]
  resources :events, only: [:show, :create]
  resources :dogs, only: [:create, :update, :destroy]
end
