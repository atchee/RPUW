class Question < ApplicationRecord
  belongs_to :theme
  has_many :answers, dependent: :destroy
  has_many :game_questions, dependent: :destroy
end
