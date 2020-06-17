Rails.application.routes.draw do
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  get 'customers/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
