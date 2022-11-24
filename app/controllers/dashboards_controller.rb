class DashboardsController < ApplicationController
  def profile
    @games = current_user.games
    @reservations = current_user.reservations
  end

  def show
  end
end
