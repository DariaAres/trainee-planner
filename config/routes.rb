# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'categories#index'

  get '/categories/new', to: 'categories#new'
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#edit'

  resources :categories
end
