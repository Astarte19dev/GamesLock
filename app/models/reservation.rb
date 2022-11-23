class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :date_start, presence: true
  validates :date_end, presence: true
end
