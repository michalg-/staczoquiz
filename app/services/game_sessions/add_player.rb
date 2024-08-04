module GameSessions
  class Create < BaseService
    def initialize(code:)
      @code = code
    end

    def call
      game_session = GameSession.find_by(code:)

      unless game_session
        errors.push('Game session not found')
        return
      end

      game_session.players.create
      result[:game_session_id] = game_session.id
    end

    private

    attr_reader :code
  end
end
