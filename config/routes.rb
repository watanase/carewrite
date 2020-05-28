Rails.application.routes.draw do
  root "posts#index"

  devise_for :post_readers
  devise_for :post_writers
  resources :companys
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
