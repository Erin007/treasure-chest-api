class Hunt < ApplicationRecord
  #belongs_to  :organizer
  #has_many :directives
  has_many :teams

  validates :name, presence: true
  validates :organizer_id, presence: true
  validates :passcode, presence: true
  validates :passcode, length: { minimum: 5 }
end
