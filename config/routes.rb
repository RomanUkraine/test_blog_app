Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    member do
      put 'like', to: 'posts#like'
    end
  end

  resources :comments do
    member do
      put 'like', to: 'comments#like'
    end
  end # TODO: only create, new

  resources :users
end
