# frozen_string_literal: true

Rails.application.routes.draw do
  resources :groups
  resources :accounts
  # get 'accounts', to: 'accounts#index'
  # get 'external_payments', to: 'payments#external_payment'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#show'
end
