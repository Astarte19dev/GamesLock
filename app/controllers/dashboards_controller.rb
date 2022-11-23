class DashboardsController < ApplicationController
  def profile
    # @games = current_user.games
    @games = current_user.games
  end

  def show
  end
end
