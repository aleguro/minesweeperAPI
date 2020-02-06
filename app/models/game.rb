class Game < ApplicationRecord

  PLAYING = 0
  PAUSED  = 1
  WON     = 2
  LOST    = 3

  belongs_to :user
  has_many :cells, dependent: :delete_all

  validates :cols, :rows, presence: true, numericality: { only_integer: true }
  validates :mines, presence: true, numericality: { only_integer: true }

  before_create :set_status
  after_create :create_cells

  scope :playing, -> { where(status: status[:playing]) }
  scope :paused,  -> { where(status: status[:paused]) }
  scope :won,     -> { where(status: status[:won]) }
  scope :lost,    -> { where(status: status[:lost]) }

  def is_over?

    status == (Game::WON || Game::LOST)
  end

  def game_over(state)

    upate_atrributes status: state
  end

  protected

  def cell_count

    rows * cols
  end

  private

  def set_status

    self.status = Game::PLAYING
  end

  def create_cells

    mines_a = Array.new( mines, 1)
    safes_a = Array.new( cell_count - mines, 0)
    all_a   = (mines_a + safes_a).shuffle

    rows.times do |x|

      cols.times do |y|

        self.cells.create( x: x, y: y, mined: all_a.pop, status: Cell::UNREVEALED)
      end
    end
  end
end
