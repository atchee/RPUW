class Attempt < ApplicationRecord
  belongs_to :participation
  belongs_to :game_question
end
