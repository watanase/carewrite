Rails.application.routes.draw do
  root "posts#index"
  resources :companys
  resources :resources
  resources :users



  get    '/login_company',   to: 'sessions#new_company'
  post   '/login_company',   to: 'sessions#create_company'
  delete '/logout_company',  to: 'sessions#destroy_company'

  get    '/login_recoder',   to: 'sessions#new_recoder'
  post   '/login_recoder',   to: 'sessions#create_recoder'
  delete '/logout_recoder',  to: 'sessions#destroy_recoder'

  get    '/login_user',   to: 'sessions#new_user'
  post   '/login_user',   to: 'sessions#create_user'
  delete '/logout_user',  to: 'sessions#destroy_user'
end
