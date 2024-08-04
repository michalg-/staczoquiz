class AddCurrentQuestionToGameSession < ActiveRecord::Migration[7.2]
  def change
    add_reference :game_sessions, :current_question, null: true, foreign_key: { to_table: :questions }
  end
end
