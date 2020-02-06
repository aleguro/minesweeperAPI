Rails.application.routes.draw do

  resources :users,only: [:create, :show] do

    resources :games, only: [:index, :show]
  end

  resources :games, only: [:create] do

    resources :cells, only: [:index]
  end

  resources :cells, only: [:update]
end
