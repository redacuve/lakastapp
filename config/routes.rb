Rails.application.routes.draw do
  resources :groups
  resources :records
  get 'profile/:id', to: 'users#show', as: 'profile'
  post 'registration', to: 'users#create'
  get 'registration', to: 'users#new'
  get 'login', to: 'static_pages#login'
  post 'login', to: 'static_pages#create_login'
  delete 'logout', to: 'static_pages#logout'
  get 'dashboard', to: 'static_pages#dashboard'
  root 'static_pages#index'
end
