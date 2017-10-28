Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: %i[create new destroy]
  resources :users, only: %i[create new show]
  resources :bands
end
