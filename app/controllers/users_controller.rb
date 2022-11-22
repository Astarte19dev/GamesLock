class UsersController < ApplicationController
  def index
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  end

  def new
  end
end
