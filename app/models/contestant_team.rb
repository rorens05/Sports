class ContestantTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team
end
