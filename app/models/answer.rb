class Answer < ApplicationRecord
  belongs_to :game_session_player
  belongs_to :question
  belongs_to :choice
end
