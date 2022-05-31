class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :attempts, through: :participations
  has_many :games, through: :participations

  def find_participation(game)
    self.participations.find_by(game: game)
  end
end
