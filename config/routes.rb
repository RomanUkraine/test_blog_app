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


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'posts#index'
end
