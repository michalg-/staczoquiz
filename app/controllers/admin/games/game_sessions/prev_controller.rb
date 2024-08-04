module Admin
  module Games
    module GameSessions
      class PrevController < AdminController
        def update
          game_session = GameSession.find(params[:games_session_id])

          prev_question = game_session.game.questions.find_by(position: game_session.current_question.position - 1)

          ActiveRecord::Base.transaction do
            game_session.update!(current_question: prev_question)

            game_session.game_session_players.each do |game_session_player|
              Turbo::StreamsChannel.
                broadcast_replace_to("game_session_#{game_session_player.id}", target: "game-session", partial: "games/question", locals: { game_session_player:, game_session: })
            end
          end

          redirect_to admin_game_path(game_session.game)
        end
      end
    end
  end
end
