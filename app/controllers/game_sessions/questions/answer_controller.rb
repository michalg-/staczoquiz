module GameSessions
  class AnswerController < ApplicationController

    def create
      game_session = game_session_player.game_session
      Answer.create!(game_session_player:, question: game_session.current_question, )

    end

    private

    def game_session_player
      @game_session_player ||= GameSessionPlayer.find_by(id: cookies[:game_session_player_id])
    end
  end
end
