class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :game_type
      t.integer :sport_id
      t.timestamp :schedule

      t.timestamps
    end
  end
end
