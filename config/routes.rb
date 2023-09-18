# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    root to: 'home#index'
    resources :events
  end
end
