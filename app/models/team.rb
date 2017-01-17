class Team < ApplicationRecord
 #has_many :players, through: :team_players
 #has_many :submissions

 validates :name, presence: true
 validates :points, numericality: true
 validates :hunt_id, presence: true
end
