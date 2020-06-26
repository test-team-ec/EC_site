Rails.application.routes.draw do

  devise_for :administers, skip: :all
  devise_scope :administer do
    get 'administers/sign_in' => 'administers/sessions#new', as: 'new_administer_session'
    post 'administers/sign_in' => 'administers/sessions#create', as: 'administer_session'
    delete 'administers/sign_out' => 'administers/sessions#destroy', as: 'destroy_administer_session'
  end


  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_up' => 'customers/registrations#new', as: 'new_customer_registration'
    post 'customers/sign_up' => 'customers/registrations#create', as: 'customer_registration'
    delete 'customers/sign_out' => 'customers/sessions#destroy', as: 'destroy_customer_session'
    get 'customers/sign_in' => 'customers/sessions#new', as: 'new_customer_session'
    post 'customers/sign_in' => 'customers/sessions#create', as: 'customer_session'
    get "customers/password/edit"  => "customers/passwords#edit", as:"edit_customer_password"
    patch  "customers/password"  => "customers/passwords#update", as: "customer_password"
    put    "customers/password" => "customers/passwords#update"
    post   "customers/password" => "customers/passwords#create"
  end

  get 'cart_items/confirm' =>"cart_items#confirm"
  delete 'cart_items/destroy_all' =>"cart_items#destroy_all", as: "cart_items_destroy_all"

  post 'orders/confirm' => "orders#confirm"
  post 'orders' => "orders#create", as:"orders"
  get 'orders/complete' => "orders#complete"
  root "homes#top"
  get "/" => "homes#top", as: "home"
  get "home_about" => "homes#about", as:"home_about"
  get "customers/delete" => "customers#delete", as:"customers_delete"

  resource :customers,only:[:show,:edit,:update, :destroy] do
    resources :shippings
    resources :orders ,only:[:index, :show, :new, :create]
    resources :cart_items, only:[:update, :create, :destroy]
  end


  namespace :admin do
    resources :orders, only:[:index, :show, :update]
    get "/" => "orders#top"
  end

  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end


  resources :products, only:[:index, :show]


  namespace :admin do
    resources :order_details ,only:[:update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres ,only:[:index, :new, :create, :edit, :update]
    resources :products ,only:[:index, :show, :new, :create, :edit, :update]
  end


  namespace :admin do
     resources :genres ,only:[:index, :new, :create, :edit, :update]
  end
end
