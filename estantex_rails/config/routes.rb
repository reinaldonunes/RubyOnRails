Rails.application.routes.draw do
  root to: "home#index"
  
  resources :book_genres
  resources :book_authors
  resources :goals
  resources :genres
  resources :authors
  resources :books
  resources :readings

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
end
