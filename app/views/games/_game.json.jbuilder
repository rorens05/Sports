json.extract! game, :id, :name, :game_type, :sport_id, :schedule, :created_at, :updated_at
json.url game_url(game, format: :json)
