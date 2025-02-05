# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :tasks, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  # BEGIN
  
  # END
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
