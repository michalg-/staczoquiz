module GameSessions
  class UpdatePlayerName < BaseService
    def initialize(name:, game_session_player_id:)
      @name = name
      @game_session_player_id = game_session_player_id
    end

    def call
      game_session_player = GameSessionPlayer.find_by(id: game_session_player_id)
      game_session = game_session_player.game_session

      unless game_session_player
        errors.push("Game session not found")
        return
      end

      ActiveRecord::Base.transaction do
        game_session_player.player.update!(name:)
        Turbo::StreamsChannel.
          broadcast_replace_to("game_session_#{game_session.id}", target: "game-session", partial: "games/participants", locals: { game_session: })
      end
    end

    private

    attr_reader :name, :game_session_player_id
  end
end
