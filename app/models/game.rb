class Game < ApplicationRecord
  has_many :contestant_teams, dependent: :destroy
  accepts_nested_attributes_for :contestant_teams
  belongs_to :sport
  belongs_to :event
  belongs_to :created_by, class_name: "Admin", foreign_key: "created_by_id", optional: true
  belongs_to :last_updated_by, class_name: "Admin", foreign_key: "last_updated_by_id", optional: true


  STATUS = [ "Scheduled", "Ongoing", "Finished" ]
  QUARTER = [ "1st Quarter", "2nd Quarter", "3rd Quarter", "4th Quarter" ]
  validates :status, inclusion: STATUS
end
