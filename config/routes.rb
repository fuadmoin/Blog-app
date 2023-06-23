Rails.application.routes.draw do
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create] do
      resources :comments, only: %i[create]
      get :like, on: :member
    end
  end
end
