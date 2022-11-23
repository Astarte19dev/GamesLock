class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
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
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.game_id = @game.id
    if @reservation.save
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation.destroy
    redirect_to profile_path(), status: :see_other
  end
end
