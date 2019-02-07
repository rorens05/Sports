class Sport < ApplicationRecord
  has_one_attached :logo
  has_many :games
  has_many :teams
end
