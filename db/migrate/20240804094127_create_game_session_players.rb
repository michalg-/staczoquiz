class CreateGameSessionPlayers < ActiveRecord::Migration[7.2]
  def change
    create_table :game_session_players do |t|
      t.references :player, null: false, foreign_key: true
      t.references :game_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
