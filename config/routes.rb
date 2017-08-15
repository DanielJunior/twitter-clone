Rails.application.routes.draw do

  root 'application#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tweets, except: [:show]
  resources :users do
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:index, :create, :destroy]
end
