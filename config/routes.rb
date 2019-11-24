Rails.application.routes.draw do
  get 'foods/index'
  resources :line_items
  resources :carts
  resources :foods, only: [:index]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#home"
  get "/cat", to: "static_pages#cat"
  get "/food", to: "static_pages#food"
  get "/detail_cat", to: "static_pages#detail_cat"
  get "/detail_food", to: "static_pages#detail_food"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  concern :paginatable do
    get "(page/:page)", action: :index, on: :collection, as: ""
  end

  resources :users, concerns: :paginatable
  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show destroy)
end
