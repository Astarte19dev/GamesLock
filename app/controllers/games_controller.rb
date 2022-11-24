class GamesController < ApplicationController
  def index
    if params[:query]
      sql_query = "name ILIKE :query"
      @games = Game.where(sql_query, query: "%#{params[:query]}%")
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    @game.save
    redirect_to game_path(@game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update!(game_params)
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :game_type, :level, :player, :age, :price, :photo)
  end
end
