class Sport < ApplicationRecord
  has_one_attached :logo
  has_many :games, dependent: :destroy
  has_many :teams, dependent: :destroy
end
