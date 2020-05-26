Rails.application.routes.draw do
  devise_for :post_readers
  devise_for :post_writers
  root "posts#index"
  resources :companys do
    collection do
      get :login
    end
  end
end
