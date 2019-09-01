Rails.application.routes.draw do


  resources :tasks, only: :index do
    resources :usertasks, only: [:create, :destroy]
  end

  resources :usertasks, only: :index

  root to: 'tasks#index'
  get 'tasks/details', to: 'tasks#details', as: 'details'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
