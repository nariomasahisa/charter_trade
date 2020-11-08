Rails.application.routes.draw do
  devise_for :users
  root to: "charters#index"
  resources :charters
end
