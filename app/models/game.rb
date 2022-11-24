class Game < ApplicationRecord
  GAME_TYPE = %w[Agility Aventure Family Humor Reflexion Strategy]
  LEVEL = %w[Easy Medium Hard]

  has_one_attached :photo
  has_one_attached :thumb
  has_one_attached :mini_thumb
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
