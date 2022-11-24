class Game < ApplicationRecord
  GAME_TYPE = %w[Agility Aventure Family Humor Reflexion Strategy]
  LEVEL = %w[Easy Medium Hard]

  has_one_attached :photo
  has_one_attached :thumb
  has_one_attached :mini_thumb
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  # validates :game_type, presence: true
  validates :level, presence: true
  validates :player, presence: true
  validates :age, presence: true
  validates :price, presence: true
end
