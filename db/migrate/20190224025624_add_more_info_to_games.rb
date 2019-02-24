class AddMoreInfoToGames < ActiveRecord::Migration[5.2]
  def change
    add_column "games", "status", :string
    add_column "games", "last_updated_by_id", :integer
    add_column "games", "created_by_id", :integer
  end
end
