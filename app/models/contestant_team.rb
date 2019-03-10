class ContestantTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team
  has_many :statistics, dependent: :destroy
end
