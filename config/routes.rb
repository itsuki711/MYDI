Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]

  get 'hello/index' => 'hello#index'
  root 'hello#index'

  resources :posts do
    collection do
      get :liked # いいねした投稿のルート
    end
    resources :likes, only: [:create, :destroy]
  end
end
