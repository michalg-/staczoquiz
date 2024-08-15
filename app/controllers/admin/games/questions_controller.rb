module Admin
  module Games
    class QuestionsController < AdminController
      def index
        questions = game.questions

        render :index, locals: { game:, questions: }
      end

      def edit
        render 'edit', locals: { game:, question: }
      end

      def update
        question.update(question_params)

        redirect_to admin_game_questions_path(game)
      end

      private

      def question_params
        params.require(:question).permit(:text)
      end

      def game
        @game ||= Game.find(params[:game_id])
      end

      def question
        @question ||= game.questions.find(params[:id])
      end
    end
  end
end
