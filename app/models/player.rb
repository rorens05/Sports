class Player < ApplicationRecord
  belongs_to :team
  has_one_attached :image
  has_many :statistics, dependent: :destroy

end
