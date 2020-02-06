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

  protected

  def cell_count

    self.rows * self.cols
  end

  private

  def set_status

    self.status = Game::PLAYING
  end

  def create_cells

    mines = Array.new( self.mines, 1)
    safes = Array.new( self.cell_count - self.mines, 0)
    all   = (mines + safes).shuffle

    rows.times do |x|

      cols.times do |y|

        self.cells.create( x: x, y: y, mined: all.pop, status: Cell::UNREVEALED)
      end
    end
  end
end
