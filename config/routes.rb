# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root to: 'home#index'
    
    get '/categories/new', to: 'categories#new'
    get '/categories/:id', to: 'categories#edit'
    resources :categories
    
    devise_for :users, path: '', controllers: { registrations: 'users/registrations' }
  end
end
