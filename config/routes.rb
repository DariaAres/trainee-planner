# frozen_string_literal: true

Rails.application.routes.draw do
  get 'category/index'
  get 'category/show'
  get 'category/create'
  get 'category/update'
  get 'category/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
