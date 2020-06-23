Rails.application.routes.draw do
  devise_for :customers

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  get 'cart_items/confirm' =>"cart_items#confirm"
  get 'cart_items/destroy_all' =>"cart_items#destroy_all"

  post 'orders/confirm' => "orders#confirm"
  post 'orders' => "orders#create", as:"orders"
  get 'orders/complete' => "orders#complete"

  get "/" => "homes#top", as: "home"
  get "home_about" => "homes#about"


  resource :customers,only:[:show,:edit,:update, :destroy] do
    resources :shippings
    resources :orders ,only:[:index, :show, :new, :create]
      namespace :admin do
        resources :orders, only:[:index, :show, :update]
      end
    resources :cart_items, only:[:update, :create, :destroy]
  end
  namespace :admin do
    resources :customers, only:[:index, :show, :edit, :update]
  end

  resources :products, only:[:index, :show]
  namespace :admin do
    resources :products ,only:[:index, :show, :new, :create, :edit, :update]
  end

  namespace :admin do
    resources :order_details ,only:[:update]
  end

  namespace :admin do
     resources :genres ,only:[:index, :new, :create, :edit, :update]
  end

end
