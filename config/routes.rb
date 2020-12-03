Rails.application.routes.draw do
  devise_for :branches

  # Show additional pages under /customers
  resources :customers do
    collection do
      get :summary
      get :qrcode
    end
  end

  root  'home#index'
  get   'home/about'
  get   'customers/summary'
  get   'customers/qrcode'

  match 'branches', to: 'branches#index', via: 'get'
  match 'home', to: 'home#index', via: 'get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
