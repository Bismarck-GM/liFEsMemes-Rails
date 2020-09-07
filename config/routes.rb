Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :users, only: [:index, :create, :new]
  resources :sessions, only: [:create, :new]
  resources :articles
  get "log_out" => "sessions#destroy"
end
