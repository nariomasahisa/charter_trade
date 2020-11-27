Rails.application.routes.draw do
  devise_for :users
  root to: "charters#index"
  resources :charters do
    resources :sells, only: [:create, :destroy]
    resources :purchases, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
