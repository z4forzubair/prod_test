Rails.application.routes.draw do
  resources :shops
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: 'shops#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
