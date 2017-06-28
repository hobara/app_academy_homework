Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :subs, only: [:new, :create, :index, :show, :update, :edit]
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :show, :edit, :update, :destroy]


end
