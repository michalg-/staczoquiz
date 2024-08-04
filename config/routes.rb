Rails.application.routes.draw do
  mount ActionCable.server => "/cable"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :admin do
    require "sidekiq/web"
    mount Sidekiq::Web => "/sidekiq"

    resources :games do
      resources :games_sessions do
        resource :run, only: [ :update ], controller: "games/game_sessions/run"
      end
    end
  end

  resource :game, only: [ :show ]
  resource :join, only: [ :show, :create ]
  resource :set_player_name, only: [ :show, :update ]
  resources :game_session, only: [] do
    resources :questions, only: [] do
      resource :answer, only: [ :create ], controller: "game_sessions/questions/answer"
    end
  end
end
