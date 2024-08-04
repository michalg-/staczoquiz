module GameSessions
  class AddPlayer < BaseService
    def initialize(code:)
      @code = code
    end

    def call
      game_session = GameSession.find_by(code:)

      unless game_session
        errors.push('Game session not found')
        return
      end

      ActiveRecord::Base.transaction do
        player = Player.create!
        game_session_player = GameSessionPlayer.create!(player:, game_session:)

        result[:game_session_player_id] = game_session_player.id

        Turbo::StreamsChannel.
          broadcast_replace_to("game_session_#{game_session.id}", target: 'game-session', partial: 'games/participants', locals: { game_session: } )
      end
    end

    private

    attr_reader :code
  end
end
