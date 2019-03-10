class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.references :contestant_team, foreign_key: true
      t.references :player, foreign_key: true
      t.text :details

      t.timestamps
    end
  end
end
