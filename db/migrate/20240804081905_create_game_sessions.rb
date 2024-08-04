class CreateGameSessions < ActiveRecord::Migration[7.2]
  def change
    create_table :game_sessions do |t|
      t.references :game, null: false, foreign_key: true
      t.string :game_phase, null: false
      t.string :code, null: false

      t.timestamps
    end
    add_index :game_sessions, :code, unique: true
  end
end
