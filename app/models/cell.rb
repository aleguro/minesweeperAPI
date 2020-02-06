class Cell < ApplicationRecord

  UNREVEALED = 0
  FLAGGED    = 1
  CLEARED    = 2
  EXPLOTED   = 3

  belongs_to :game

  validates :x, presence: true, numericality: { only_integer: true }
  validates :y, presence: true, numericality: { only_integer: true }

  def click

    return if self.status == Cell::FLAGGED

    if mined

      update_attributes status: Cell::EXPLOTED
      game.game_over Game::LOST
    else

      update_attributes status: Cell::CLEARED
      clear_adjacent self.game, self.x, self.y

      #check for winner ?

    end
  end

  def flag

    case self.status

      when Cell::UNREVEALED

        update_attributes status: Cell::FLAGGED
      when Cell::FLAGGED

        update_attributes status: Cell::UNREVEALED
      when Cell::CLEARED
        # Ignore.
      else
        # Ignore.
    end
  end

  private

  def clear_adjacent(game, x, y)

  end
end
