Rails.application.routes.draw do
  devise_for :post_readers
  devise_for :post_writers
  root "posts#index"
  resources :companys
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
