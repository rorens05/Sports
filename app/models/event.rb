class Event < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :teams, dependent: :destroy
  
end
