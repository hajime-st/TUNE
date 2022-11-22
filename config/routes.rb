Rails.application.routes.draw do
  root 'home#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create] do
    member do
      get :following, :followers
    end
  end
  resource :profile, only: %i[show edit update]
  resources :relationships, only: %i[create destroy]
  resources :themes do
    resources :answers, only: %i[create update destroy]
  end
end
