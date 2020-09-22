# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'
  resources :users, only: %i[index create new]
  resources :sessions, only: %i[create new]
  resources :articles, only: %i[create index new show] do
    resources :votes, only: [:create, :destroy]
  end
  resources :categories, only: [:show]
  get 'log_out' => 'sessions#destroy'
end
