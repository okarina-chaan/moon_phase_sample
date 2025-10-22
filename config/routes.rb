Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
  get "home/index"
  get "moons/index"
  get "moons/show"
end
