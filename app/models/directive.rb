class Directive < ApplicationRecord
  belongs_to :hunt
  has_many :submissions

  validates :complete, presence: true
  validates :hunt_id, presence: true
  validates :name, presence: true
  #validates :point_value, numericality: true
end
