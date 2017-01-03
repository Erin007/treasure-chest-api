class Directive < ApplicationRecord
  belongs_to :hunts
  has_many :submissions

  validates :complete?, presence: true
  validates :hunt_id, presence: true
  validates :name, presence: true
  validates :point_value, numericality: true { only_integer: true }
end
