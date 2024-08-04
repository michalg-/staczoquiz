class Player < ApplicationRecord
  belongs_to :game_session_player, optional: true
end
