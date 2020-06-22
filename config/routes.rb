Rails.application.routes.draw do

#   devise_for :customers, skip: :all
# devise_scope :customer do
#     get 'customers/sign_up' => 'customers/registrations#new'
#     post 'customers/sign_up' => 'customers/registrations#create'
#     delete 'customers/sign_out' => 'customers/sessions#destroy'
#     get 'customers/sign_in' => 'customers/sessions#new'
#     post 'customers/sign_in' => 'customers/sessions#create'
#    end





# devise_for :admins, skip: :all
#   devise_scope :admin do
#     get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
#     post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
#     delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
#  end



  devise_for :admins, controllers:{
      sessions: 'admin/devise/sessions',
      passwords: 'admin/devise/passwords'
    }

  devise_for :customers


      #sessions: 'public/devise/sessions',
      #registrations: 'public/devise/registrations'
      #passwords: 'public/devise/passwwords'
    #} 




  get 'cart_items/confirm' =>"cart_items#confirm"
  get 'cart_items/destroy_all' =>"cart_items#destroy_all"

  get 'orders/confirm' => "orders#confirm"
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

  resources :products, only:[:index, :show]


  namespace :admin do
    resources :order_details ,only:[:update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :genres ,only:[:index, :new, :create, :edit, :update]
    resources :products ,only:[:index, :show, :new, :create, :edit, :update]
  end



end
