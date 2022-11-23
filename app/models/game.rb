class Game < ApplicationRecord
  TYPE = %w[strategy family aventure]

  has_one_attached :photo
  belongs_to :user
  has_many :reservations
end
