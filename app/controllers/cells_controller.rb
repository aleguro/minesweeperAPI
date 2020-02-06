class CellsController < ApplicationController
  #TODO: Add validations to prevent:
    #1. indexing over a wrong game ID
    #2. calling an update on an action that is not either 'CLICK' or 'FLAG'

  # GET /games/1/cells
  def index

    game = Game.find(params[:game_id]).includes(:cells)

    render json: user, status: :ok
  end

  # PUT /cells/1
  #  params: { action: 'CLICK'|'FLAG' }
  def udpate

    cell = Cell.find(params[:id])

    cell.send(params[:action])

    game = cell.game.reload!

    render json: game, include: :cells, status: :ok
  end
end
