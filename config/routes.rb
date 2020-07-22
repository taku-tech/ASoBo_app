Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

  scope module: :users do
    root 'home#top'
    get 'about' => 'home#about', as: :about
    get 'level' => 'questions#level', as: :level
    resources :users, only: [:show, :edit, :update]
    resources :words, only: [:index] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :favorites, only: [:index]
    resources :questions, only: [:show, :create]
    post 'questions/:id' => 'questions#next', as: :next
  end
  get 'search' => 'search#search', as: :search

  namespace :admins do
    root 'home#top'
    get 'main' => 'home#main', as: :main
    resources :admins, only: [:show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :words, only: [:index, :new, :show, :create, :edit, :update, :destroy]
  end
end
