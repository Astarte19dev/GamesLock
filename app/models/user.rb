class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :address, presence: true
  validates :city, presence: true
end
