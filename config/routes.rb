Rails.application.routes.draw do
  root "users#index"

  resources :companies, only:[:index, :new, :create, :show, :edit, :update] do
    resources :groups
    resources :recorders, only:[:index, :new, :create, :destroy]
    resources :opinions, only:[:index, :new, :create]
  end

  resources :users do
    resources :families, only:[:new, :create, :edit, :update, :destroy]
    resources :posts, except:[:show] do
      collection do
        get :family_see
        get :search
      end
    end
    member do
      get :move_out, :family_see
    end
  end


  get  '/users/:id/posts/:yyyymm', to: 'users#archives', as: :user_archive
  get  '/users/:id/family/:yyyymm', to: 'users#family_archives', as: :user_family_archive

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
