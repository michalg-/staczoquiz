class GameSessionPlayer < ApplicationRecord
  belongs_to :player
  belongs_to :game_session
end
