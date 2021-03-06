Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get "followed"
      get "follower"
    end
  end

  resources :books do
    resource :favorites,only: [:create,:destroy]
    resources :book_comments,only: [:create,:destroy]
  end
  resources :relationships, only: [:create,:destroy]
  #post ":user_id/relationships", to:"relationships#create",as:"relationships"
  #delete ":user_id/relationship", to:"relationships#destroy",as:"relationship"
  root 'homes#top'
  get 'home/about' => 'homes#about'

end