# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :post_comments, shallow: true
  end
  # END
end
