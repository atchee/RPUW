Rails.application.routes.draw do
  # get 'errors/not_found'
  # get 'errors/internal_server_error'
  # match "/404", to: "errors#not_found", via: :all
  # match "/500", to: "errors#internal_server_error", via: :all

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
