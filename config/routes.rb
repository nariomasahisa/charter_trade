Rails.application.routes.draw do
  get 'charters/index'
  root to: "charters#index"
end
