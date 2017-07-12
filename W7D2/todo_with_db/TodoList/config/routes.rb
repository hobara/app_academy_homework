Rails.application.routes.draw do

  root 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :todos, only: [:show, :index, :create, :update, :destroy]
  end
end
