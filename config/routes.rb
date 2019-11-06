Rails.application.routes.draw do
  resources :mytests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :configs
  resources :logins
  resources :api
  resources :questionstatus
  resources :questions
end
