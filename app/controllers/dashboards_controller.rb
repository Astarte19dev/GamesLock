class DashboardsController < ApplicationController
  def profile
    @my_games = current_user.games
    @my_reservations = current_user.reservations
    @all_reservations = Reservation.all
    @reservations_demand = Reservation.where.not(user: current_user).where(game: current_user.games)
  end

  def show
  end
end
