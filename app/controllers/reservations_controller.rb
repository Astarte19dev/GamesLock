class ReservationsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new
  end

  def create
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new(reservation_param)
  end

  def destroy
  end
end
