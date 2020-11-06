Rails.application.routes.draw do
  devise_for :users
  get 'charters/index'
  root to: "charters#index"
end
