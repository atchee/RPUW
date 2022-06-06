class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :attempts, through: :participations
  has_many :games, through: :participations
  has_one_attached :photo

  def find_participation(game)
    participations.find_by(game: game)
  end
end
