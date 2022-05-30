class Game < ApplicationRecord
  has_many :participations
  has_many :players, through: :participations, source: :user
  has_many :game_questions
  has_many :questions, through: :game_questions
end
