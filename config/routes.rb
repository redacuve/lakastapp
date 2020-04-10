Rails.application.routes.draw do
  post 'registration', to: 'users#create'
  get 'registration', to: 'users#new'
  get 'login', to: 'static_pages#login'
  post 'login', to: 'static_pages#create_login'
  delete 'logout', to: 'static_pages#logout'
  get 'dashboard', to: 'static_pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
end
