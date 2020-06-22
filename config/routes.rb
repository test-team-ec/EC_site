Rails.application.routes.draw do

  devise_for :administers, skip: :all
  devise_scope :administer do
    get 'administers/sign_in' => 'administers/sessions#new', as: 'new_administer_session'
    post 'administers/sign_in' => 'administers/sessions#create', as: 'administer_session'
    delete 'administers/sign_out' => 'administers/sessions#destroy', as: 'destroy_administer_session'
  end


  devise_for :customers

  get 'cart_items/confirm' =>"cart_items#confirm"
  get 'cart_items/destroy_all' =>"cart_items#destroy_all"

  get 'orders/confirm' => "orders#confirm"
  get 'orders/complete' => "orders#complete"

  get "/" => "homes#top", as: "home"
  get "home_about" => "homes#about"

  resource :customers,only:[:show,:edit,:update, :destroy] do
    resources :shippings
    resources :orders ,only:[:index, :show, :new, :create]
    resources :cart_items, only:[:update, :create, :destroy]
  end


  namespace :admin do
    resources :orders, only:[:index, :show, :update]
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
