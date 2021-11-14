Rails.application.routes.draw do
  get "book_comments/create"
  get "book_comments/destroy"
  root "homes#top"
  get "home/about" => "homes#about"
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
