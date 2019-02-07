class Team < ApplicationRecord
  has_one_attached :logo
  belongs_to :sport
  belongs_to :event
  has_many :players
end
