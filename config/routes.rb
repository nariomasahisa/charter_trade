Rails.application.routes.draw do
  devise_for :users
  root to: "charters#index"
  resources :charters do
    resources :sells, only: [:create, :destroy]
    resources :purchases, only: [:index, :create]
  end
  resources :users, only: :show
end
