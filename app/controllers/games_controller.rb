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
  end

  def update
  end

  def destroy
  end
end
