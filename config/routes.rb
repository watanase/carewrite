Rails.application.routes.draw do
  root "posts#index"
  resources :companies, only:[:index, :new, :create, :show]
  resources :recorders, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create, :show]
  resources :groups, only:[:new, :create, :show]


  get    '/login_company',   to: 'sessions#new_company'
  post   '/login_company',   to: 'sessions#create_company'
  delete '/logout_company',  to: 'sessions#destroy_company'

  get    '/login_recorder',   to: 'sessions#new_recorder'
  post   '/login_recorder',   to: 'sessions#create_recorder'
  delete '/logout_recorder',  to: 'sessions#destroy_recorder'

  get    '/login_user',   to: 'sessions#new_user'
  post   '/login_user',   to: 'sessions#create_user'
  delete '/logout_user',  to: 'sessions#destroy_user'
end
