Rails.application.routes.draw do
  get "matches/index"
  resources :players

  resources :matches do
    scope module: :matches do
      resources :rounds
    end
  end

  resources :scores

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  root "matches#index"
end
