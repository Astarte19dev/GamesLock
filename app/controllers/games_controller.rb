class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to game_path(game)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:name, :description, :type, :level, :player, :age, :price)
  end

end
