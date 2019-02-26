class Game < ApplicationRecord
  has_many :contestant_teams
  accepts_nested_attributes_for :contestant_teams
  belongs_to :sport
  belongs_to :event
  belongs_to :created_by, class_name: "Admin", foreign_key: "created_by_id"
  belongs_to :last_updated_by, class_name: "Admin", foreign_key: "last_updated_by_id"


  STATUS = [ "Scheduled", "Ongoing", "Finished" ]
  validates :status, inclusion: STATUS
end
