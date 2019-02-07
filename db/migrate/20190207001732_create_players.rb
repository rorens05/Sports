class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :contact_no
      t.string :address
      t.string :school
      t.integer :year
      t.string :course
      t.integer :team_id

      t.timestamps
    end
  end
end
