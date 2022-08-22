Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # config/routes.rb
  get "index", to: "datenight#index"
  get "search", to: "datenight#search"
end
