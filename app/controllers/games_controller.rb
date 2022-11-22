class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
    @reservation = Reservation.new
  end

  def new
  end

  def create
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
end
