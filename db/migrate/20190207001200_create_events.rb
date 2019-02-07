class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :event_date
      t.string :venue
      t.string :organizer

      t.timestamps
    end
  end
end
