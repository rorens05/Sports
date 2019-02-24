Rails.application.routes.draw do
  root 'access#login'
  post 'access/attempt_login'
  delete 'access/logout'
  resources :sports
  resources :admins
  resources :contestant_teams
  resources :games
  resources :players
  resources :teams
  resources :events

  namespace 'api' do
    namespace 'v1' do
      get 'access/index'
      post 'access/attempt_login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
