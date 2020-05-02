Rails.application.routes.draw do
  root to: "vehicles#index"
  resources :vehicles, only: %i[index show]
end
