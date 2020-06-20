Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins




  get 'cart_items/confirm' =>"cart_items#confirm"
  get 'cart_items/destroy_all' =>"cart_items#destroy_all"

  get 'orders/confirm' => "orders#confirm"
  get 'orders/complete' => "orders#complete"

  get "/" => "homes#top"
  get "home_about" => "homes#about"


  resource :customers,only:[:show,:edit,:update,:desteoy] do
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
