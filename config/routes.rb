Rails.application.routes.draw do
  resources :statistics
  get 'live_view/result'
  get 'live_view/single_game'
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
      get 'editor/sports'
      get 'editor/events'
      get 'editor/teams'
      get 'editor/games'
      post 'editor/new_game'
      post 'editor/edit_game'
      get 'editor/get_game'
      post 'editor/add_points'
      post 'editor/sub_points'
      post 'editor/add_assist'
      post 'editor/sub_assist'
      post 'editor/add_foul'
      post 'editor/sub_foul'
      post 'editor/add_rebound'
      post 'editor/sub_rebound'
      post 'editor/update_is_playing'
      get 'editor/get_players'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
