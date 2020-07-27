Rails.application.routes.draw do


  get 'search' => 'search#search'
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :client_users, controllers: {
    sessions:      'client_users/sessions',
    passwords:     'client_users/passwords',
    registrations: 'client_users/registrations'
  }

  get 'homes/about'
  namespace :admin do
    get 'client_users/index'
    get 'client_users/show'
    get 'client_users/edit'
    get 'client_users/search'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'orders/index'
  end
  namespace :admin do
    get 'products/new'
    get 'products/index'
    get 'products/show'
    get 'products/edit'
  end
  namespace :admin do
    get 'orders/top'
    get 'orders/index'
    get 'orders/show'
  end
  get 'products/index'
  get 'products/show'
  get 'orders/index'
  get 'orders/show'
  get 'orders/address_check'
  get 'orders/order_check'
  get 'orders/thanks'
  get 'addresses/index'
  get 'addresses/edit'
  get 'carts/index'
  get 'client_users/show'
  get 'client_users/edit'
  get 'client_users/withdrawal'

  # devise_scope :admins do
  #   '/admins/sign_out' => 'admins/devise/sessions#destroy'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #admin
  namespace	:admin	do
     #resources :orders, only: [:index]
     get 'orders/top' => 'orders#top'
     resources :client_users, only: [:index, :show, :edit, :update] do
      resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
      end
    end
    resources	:products, only: [:new, :create, :index, :show, :edit, :update]
    resources	:genres, only: [:create, :index, :edit, :update]
  end
  #client_user
  resources :client_users, only: [:show, :edit, :update] do
    get '/withdrawal' => 'client_users#withdrawal'
    patch '/withdrawal' => 'client_users#withdrawal_update'
    put '/withdrawal' => 'client_users#withdrawal_update'
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :carts, only: [:index, :create, :update, :destroy]
    delete '/carts' => 'carts#all_destroy'
    get '/address_check' => 'orders#address_check'
    get '/order_check' => 'orders#order_check'
    get '/thanks' => 'orders#thanks'
    resources :orders, only: [:index, :show, :create]
  end
  get '/home/about' => 'home#about'
  root 'products#index'
  resources :products, only: [:show]

end
