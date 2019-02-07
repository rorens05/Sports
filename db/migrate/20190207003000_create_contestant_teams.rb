class CreateContestantTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :contestant_teams do |t|
      t.integer :team_id
      t.integer :score
      t.integer :game_id

      t.timestamps
    end
  end
end
