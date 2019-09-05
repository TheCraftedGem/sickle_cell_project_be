Rails.application.routes.draw do
  namespace :admin do
    resources :users

    root to: 'users#index'
  end
  # namespace :admin do
  #   resources user, only: %i(index show create update destroy)
  # end

  # User controller actions

  namespace :api do
    namespace :v1 do
      #User routes
      # get '/user', to: 'user#show'
      # get '/users', to: 'user#index'
      post '/update_user', to: 'users#update'
      # get '/user_delete', to: 'user#destroy'
      post '/user_create', to: 'users#create'

      post '/authenticate', to: 'authentication#authenticate'

      #Patient routes
      get '/patients', to: 'patients#index'
      get '/patient', to: 'patients#show'
      patch '/patient_update', to: 'patients#update'

      #Search routes
      get '/search', to: 'search#search'

      #Scan routes
      get '/scan', to: 'scans#show'
      post '/scan_create', to: 'scans#create'
      patch '/scan_update', to: 'scans#update'
      delete '/scan_delete', to: 'scans#destroy'
    end
  end

  post "/multi_auth", to: 'user_mfa_session#create'

  resources :user_confirmations, only: [:confirm_email] do
    member do
      get :confirm_email
    end
  end

  #Confirmation and password reset routes
  post 'password/forgot', to: 'userconfirmations#forgot'
  post 'password/reset', to: 'userconfirmations#reset'
end
