class GameSession < ApplicationRecord
  belongs_to :game
  belongs_to :current_question, optional: true, class_name: "Question"
  has_many :game_session_players, dependent: :delete_all
  has_many :players, through: :game_session_players, dependent: :delete_all

  enum :game_phase, {
    starting: "starting",
    ongoing: "ongoing",
    finished: "finished"
  }
end
