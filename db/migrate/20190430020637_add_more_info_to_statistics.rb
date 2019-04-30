class AddMoreInfoToStatistics < ActiveRecord::Migration[5.2]
  def change
    add_column :statistics, :isPlaying, :boolean
    add_column :statistics, :points, :integer
    add_column :statistics, :assists, :integer
    add_column :statistics, :rebound, :integer
    add_column :statistics, :foul, :integer
  end
end
