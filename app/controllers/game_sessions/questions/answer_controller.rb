module GameSessions
  module Questions
    class AnswerController < ApplicationController
      def create
        game_session = game_session_player.game_session
        question = Question.find(params[:question_id])
        choice = Choice.find(params[:choice_id])

        if question != game_session.current_question
          # TODO: it means user send answer too late or sth
        end


        answer = Answer.create!(
          game_session_player:, question:, choice:, correct: question.correct_choice == choice
        )

        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("game_#{game_session_player.id}_#{question.id}", partial: "games/answers", locals: { game_session_player:, answer: }) }
        end
      rescue ActiveRecord::RecordNotUnique
        answer = Answer.find_by!(
          game_session_player:, question:
        )
        answer.update!(choice:, correct: question.correct_choice == choice)

        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("game_#{game_session_player.id}_#{question.id}", partial: "games/answers", locals: { game_session_player:, answer: }) }
        end
      end

      private

      def game_session_player
        @game_session_player ||= GameSessionPlayer.find_by(id: cookies[:game_session_player_id])
      end
    end
  end
end
