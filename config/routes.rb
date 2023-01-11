Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'home#top'
  get '/terms', to: 'home#terms'
  get '/privacy', to: 'home#privacy'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  post '/guest_login', to: 'user_sessions#guest_login'
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
  resources :password_resets, only: %i[new create edit update]
end
