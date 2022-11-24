class Game < ApplicationRecord
  GAME_TYPE = %w[Agility Aventure Family Humor Reflexion Strategy]
  LEVEL = %w[Easy Medium Hard]

  has_one_attached :photo
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
