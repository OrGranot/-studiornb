Rails.application.routes.draw do
  devise_for :users
  root to: 'studios#index'
  get "studios", to: "studios#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :studios do
    resources :reservations
  end
end
