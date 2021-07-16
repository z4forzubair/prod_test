Rails.application.routes.draw do
  resources :shops
  devise_for :users, controllers: {
    # sessions: 'users/sessions',
    'registrations': 'users/registrations'
  }
  root to: 'shops#show_shops'
  get 'show_shops', to: 'shops#show_shops'
  get 'search', to: 'shops#search'
  post 'send_email/:id', to: 'shops#send_email', as: 'send_email'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
