Rails.application.routes.draw do
  devise_for :users
  root to: 'studios#index'
  resources :studios do
    resources :reservations
  end
end
