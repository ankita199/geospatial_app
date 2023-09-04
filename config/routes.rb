Rails.application.routes.draw do
  namespace :api do
    get 'tickets/create'
  end
  resources :tickets
  root "tickets#index"
end
