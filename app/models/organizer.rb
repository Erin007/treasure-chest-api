class Organizer < ApplicationRecord
  has_many :hunts
  validates :username, uniqueness: true 
end
