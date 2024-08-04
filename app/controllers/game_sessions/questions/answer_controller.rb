module GameSessions
  module Questions
    class AnswerController < ApplicationController

      def create
        game_session = game_session_player.game_session
        question = Question.find(params[:question_id])
        choice = Choice.find(params[:choice_id])

        if question != game_session.current_question
          #TODO: it means user send answer too late or sth
        end


        Answer.create!(
          game_session_player:, question:, choice:, correct: question.correct_choice == choice
        )
      rescue ActiveRecord::RecordNotUnique
        Answer.find_by!(
          game_session_player:, question:
        ).update!(choice:, correct: question.correct_choice == choice)
      end

      private

      def game_session_player
        @game_session_player ||= GameSessionPlayer.find_by(id: cookies[:game_session_player_id])
      end
    end
  end
end
