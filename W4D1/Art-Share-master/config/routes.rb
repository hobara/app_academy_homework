Rails.application.routes.draw do

  # resources :users


# get     '/users'        =>      'users#index', as: 'users'
# post    '/users'           => 'users#create'
# get     '/users/new'      => 'users#new', as: 'new_user'
# get     '/users/:id/edit' =>'users#edit', as: 'edit_user'
# get     '/users/:id'    =>  'users#show', as: 'user'
# patch   '/users/:id'  =>    'users#update'
# put     '/users/:id'   =>   'users#update'
# delete  '/users/:id'  =>   'users#destroy'

resources :users, only: [:index, :create, :show, :update, :destroy]
resources :artworks, only: [:create, :show, :update, :destroy]
resources :artwork_shares, only: [:create, :destroy]

resources :users do
  resources :artworks, only: [:index]
end

end
