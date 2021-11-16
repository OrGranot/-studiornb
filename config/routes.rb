Rails.application.routes.draw do
  devise_for :users
  root to: 'studios#index'
  get "studios/index", to: "studios#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/studios/new", to: "studios#new", as: :new_studio
  post "/studios", to: "studios#create"

  get "studios/:id/edit"
end
