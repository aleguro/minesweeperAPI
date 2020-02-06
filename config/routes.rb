Rails.application.routes.draw do

  resources :users,only: [:create, :show] do

    resources :games, only: [:index]
  end

  resources :games, only: [:create, :show, :update] do

    resources :cells, only: [:index]
  end

  resources :cells, only: [:update]
end
