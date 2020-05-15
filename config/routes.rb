Rails.application.routes.draw do
  resources :groups, only: [:index, :show, :new, :create]
  resources :records
  get 'profile/:id', to: 'users#show', as: 'profile'
  post 'registration', to: 'users#create'
  get 'registration', to: 'users#new'
  get 'profile/edit/:id', to: 'users#edit', as: 'profile_edit'
  patch 'profile/update/:id', to: 'users#update', as: 'profile_update'
  get 'login', to: 'static_pages#login'
  post 'login', to: 'static_pages#create_login'
  delete 'logout', to: 'static_pages#logout'
  get 'dashboard', to: 'static_pages#dashboard'
  get 'allrecords', to: 'records#allmyrecords'
  get 'allexternalrecords', to: 'records#allmyexternalrecords'
  root 'static_pages#index'
end
