Rails.application.routes.draw do
  devise_for :branches
  resources :customers

  root  'home#index'
  match 'home', to: 'home#index', via: 'get'
  
  get   'home/about'

  match 'branches', to: 'branches#index', via: 'get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
