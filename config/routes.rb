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
  end

  namespace :admins do
    root 'home#top'
    get 'main' => 'home#main', as: :main
    resources :genres, only: [:index, :create, :edit, :update]
    resources :words, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
