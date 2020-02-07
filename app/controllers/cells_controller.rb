class CellsController < ApplicationController
  #TODO: Add validations to prevent:
    #1. indexing over a wrong game ID
    #2. calling an update on an action that is not either 'CLICK' or 'FLAG'

  # GET /games/1/cells
  def index

    game = Game.find(params[:game_id])

    render json: game,  include: :cells, status: :ok
  end

  # PUT /cells/1
  #  params: { axtion: 'CLICK'|'FLAG' }
  def update

    cell = Cell.find(params[:id])

    if cell.game.is_over?

      render json: game, include: :cells, status: :no_content
    end

    cell.send(cells_params[:axtion])

    game = cell.game.reload

    render json: game, include: :cells, status: :ok
  end

  private

  def cells_params

    params.permit(:id, :axtion)
  end
end
