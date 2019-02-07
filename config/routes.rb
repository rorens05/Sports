Rails.application.routes.draw do
  resources :sports
  resources :admins
  resources :contestant_teams
  resources :games
  resources :players
  resources :teams
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
