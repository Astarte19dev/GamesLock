class ReservationsController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:game_id])
  end

  def new
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new
  end

  def create
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new(reservation_param)
    @reservation.game_id = @game.id
    if @reservation.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end
end
