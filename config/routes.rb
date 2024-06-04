Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root 'questions#index'
  resources :questions do
    resources :answers, only: %w[create update destroy]
  end
end

