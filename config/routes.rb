Rails.application.routes.draw do
  devise_for :users

  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html\
  resources :listings, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :offers
    member do
      get :seller
    end
  end

  resources :users, only: :show do
    resources :listings, only: :index
    get :offers, to: "offers#user_index"
  end

  get "sales", to: "offers#sales"
  get "status", to: "offers#status"



  # Defines the root path route ("/")
  # root "articles#index"
end
