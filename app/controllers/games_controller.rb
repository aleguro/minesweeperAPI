class GamesController < ApplicationController
  #TODO: Add concern to verify presence of user on [index, show]
  #TODO: Modify index to allow query the games by scope ?status=won | ?status=lost

  # GET /users/1/games
  def index

    games = User.find(params[:user_id]).games.all

    render json: games, status: :ok
  end

  # GET /users/1/games/1
  def show

    game = Game.where(id: params[:id]).include(:cells).first

    if game.present?

      render json: game, include: :cells, status: :ok
    else

      render nothing: true, status: :not_found
    end
  end

  # POST /games
  #  params: {user_id: 1, cols: 10, rows: 10, mines:20 }
  def create

    game = Game.new(game_params)

    if game.save

      render json: game, include: :cells, status: :ok
    else

      render json: user.errors.full_messages, status: :bad_request
    end
  end

  private

  def game_params

    params.require(:games).permit(:user_id, :cols, :rows, :mines)
  end
end
