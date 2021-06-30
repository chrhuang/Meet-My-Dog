Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard", as: "dashboard"
  get "/join/:id", to: "events#join", as: "join"
  resources :sites, only: [:index, :show] do
    resources :walks, only: [:new, :create]
  end
  resources :events, only: [:show, :create, :destroy]
  resources :dogs, only: [:create, :update, :destroy]
  resources :messages, only: [:create]
  resources :reviews, only: [:new, :create]
end
