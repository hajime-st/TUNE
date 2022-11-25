Rails.application.routes.draw do
  root 'home#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: %i[create destroy]
  resources :themes do
    resources :answers, only: %i[create update destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :likes, only: %i[create destroy]
end
