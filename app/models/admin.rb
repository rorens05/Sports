class Admin < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  USER_TYPES = [ "admin", "editor" ]
  validates :user_type, inclusion: USER_TYPES
  
  belongs_to :sport, optional: :true
end
