Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions',
  passwords: 'users/passwords'
}

  # ゲストログイン用
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end

  root to: "homes#top"
  get "home/about"=>"homes#about"

  get 'search' => 'searches#search'

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'relationships/followings'
    get 'relationships/followers'
    post "search" => "users#search"
    resources :messages, only: [:index, :create]
  end

  resources :groups do
    resource :group_users, only: [:create, :destroy]
    resources :notices, only: [:new, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
