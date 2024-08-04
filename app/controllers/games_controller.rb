class GamesController < ApplicationController

  def show
    render :show, locals: {
      game: game_session_player.game_session.game,
      game_session: game_session_player.game_session,
      game_session_player: game_session_player
    }
  end

  private

  def game_session_player
    @game_session_player ||= GameSessionPlayer.find_by(id: cookies[:game_session_player_id])
  end
end
