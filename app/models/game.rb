class Game < ApplicationRecord
  has_many :contestant_teams
  accepts_nested_attributes_for :contestant_teams
  belongs_to :sport
  belongs_to :event
end
