Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :planes do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [ :index, :edit, :update, :show ]
  resources :plane_models, only: [ :create, :update, :edit ]
end
