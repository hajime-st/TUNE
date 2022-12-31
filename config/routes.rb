Rails.application.routes.draw do
  root 'home#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, param: :username do
    member do
      get :following, :followers
      get :themes
      get :answers
      get :likes
    end
  end
  resource :profile, only: %i[edit update]
  resources :relationships, only: %i[create destroy]
  resources :themes do
    resources :answers
    resources :comments, only: %i[create destroy]
  end
  resources :likes, only: %i[create destroy]
end
