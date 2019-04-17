Rails.application.routes.draw do
  namespace :admin do
      resources :users

      root to: "users#index"
    end
  # namespace :admin do
  #   resources user, only: %i(index show create update destroy)
  # end

  # get '/user', to: 'user#show'
  # get '/users', to: 'user#index'
  # post '/update_user', to: 'user#update'
  # get '/user_delete', to: 'user#destroy'
  # post '/user_create', to: 'user#create'


end
