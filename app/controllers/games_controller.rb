class GamesController < ApplicationController
  def index
    @games = Game.all
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
    @game = game.find(params[:id])
    @game.update(params[:game])
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :type, :level, :player, :age, :price, :photo)
  end

end
