class Cell < ApplicationRecord

  UNREVEALED = 0
  FLAGGED    = 1
  CLEARED    = 2

  belongs_to :game

  validates :x, presence: true, numericality: { only_integer: true }
  validates :y, presence: true, numericality: { only_integer: true }
end
