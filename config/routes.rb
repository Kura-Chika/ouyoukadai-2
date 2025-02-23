Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  get "search" => "searches#search"
  devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get "followers" => "relationships#followers", as: "followers"
      get "followings" => "relationships#followings", as: "followings"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end