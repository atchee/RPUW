Rails.application.routes.draw do
# Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: "pages#home"

  resources :users, only: [:testdesk] do
    get "/testdesk", to: "pages#testdesk"
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :games, only: [:create, :show] do
    member do
      post "/start", to: "games#start"
      post "/end", to: "games#end"
      post "/next_question", to: "games#next_question"
    end
  end

  resources :participations, only: [] do
    member do
      post "/ready", to: "participations#ready"
      post "/answer", to: "answers#answer"
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
