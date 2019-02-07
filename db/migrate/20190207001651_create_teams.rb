class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :sport_id
      t.integer :event_id

      t.timestamps
    end
  end
end
