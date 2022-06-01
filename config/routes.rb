Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :games, only: [:create, :show] do
    member do
      post "/start", to: "games#start"
    end
  end

  resources :participations, only: [] do
    member do
      post "/ready", to: "participations#ready"
      post "/answer", to: "participations#answer"
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
