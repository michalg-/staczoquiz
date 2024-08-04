class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.references :game_session_player, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true
      t.boolean :correct, null: false, default: false

      t.timestamps
    end

    add_index :answers, [ :game_session_player_id, :question_id ], unique: true
  end
end
