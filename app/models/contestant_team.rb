class ContestantTeam < ApplicationRecord
  belongs_to :game
  belongs_to :team, optional: :true
  has_many :statistics, dependent: :destroy
end
