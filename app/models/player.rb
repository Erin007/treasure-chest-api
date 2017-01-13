class Player < ApplicationRecord
  validates :username, presence: true
end
