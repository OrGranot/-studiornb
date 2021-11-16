Rails.application.routes.draw do
  devise_for :users
  root to: 'studios#index'

  # studios
  get "studios/index", to: "studios#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/studios/:id', to: 'studios#show', as: :studio

  resources :studios do
    resources :reservations
  end
end
