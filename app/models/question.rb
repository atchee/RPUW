class Question < ApplicationRecord
  belongs_to :theme
  has_many :answers
  has_many :game_questions
end
