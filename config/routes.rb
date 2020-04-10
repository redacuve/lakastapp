Rails.application.routes.draw do
  post 'registration', to: 'users#create'
  get 'registration', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
end
