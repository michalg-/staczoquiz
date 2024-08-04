module Admin
  module Games
    module GameSessions
      class RunController < AdminController
        def update
          game_session = GameSession.find(params[:games_session_id])

          game_session.update!(
            game_phase: :ongoing,
            current_question: game_session.game.questions.order(:position).first
          )

          Turbo::StreamsChannel.
            broadcast_replace_to("game_session_#{game_session.id}", target: 'game-session', partial: 'games/question', locals: { game_session: } )

          redirect_to admin_game_path(game_session.game)
        end
      end
    end
  end
end
