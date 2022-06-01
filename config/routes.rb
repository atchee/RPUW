Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :games, only: [:create, :show]
  post '/games/start_game' => 'games#start_game', as: 'start_game'
  resources :participations, only: [] do
    member do
      post "/ready", to: "participations#ready"
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
