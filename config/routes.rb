Rails.application.routes.draw do
  root to: 'registries#new'

  namespace :admin do
    get 'users/index'
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }

  devise_scope :user do
    get 'signin' => 'users/sessions#new'
  end

  namespace :admin do
    resources :users
    resources :registries, only: %i[index]
  end

  resources :registries, only: %i[new create]
end
