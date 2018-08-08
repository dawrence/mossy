Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :product_categories, only: %w[update create index show]
    resources :supply_categories, only: %w[update create index show]
  end
end
