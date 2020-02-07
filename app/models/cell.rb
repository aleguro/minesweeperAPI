class Cell < ApplicationRecord

  #TODO: Install machine_state gem to manage status transitions

  UNREVEALED = 0
  FLAGGED    = 1
  CLEARED    = 2
  EXPLOTED   = 3

  belongs_to :game

  validates :x, presence: true, numericality: { only_integer: true }
  validates :y, presence: true, numericality: { only_integer: true }

  def click

    return if status == Cell::FLAGGED

    if mined

      update_attributes status: Cell::EXPLOTED
      game.game_over Game::LOST
    else

      update_attributes status: Cell::CLEARED
      clear_adjacent game, x, y

      game.game_over(Game::WON) if game.is_won?
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

    #TODO: Recursive function to clear adjacent mines and flag mine count near by
  end
end
