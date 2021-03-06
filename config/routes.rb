Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :reviews do
    resources :comments
    resource :bookmark
  end
  resources :users
  resource :session
  resource :account
  get "about", to: "pages#about"
  get "terms", to: "pages#terms"
  get "privacy", to: "pages#privacy"
  root "pages#home"
end 
