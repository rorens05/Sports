class Game < ApplicationRecord
  has_many :contestant_teams
  accepts_nested_attributes_for :contestant_teams
end
