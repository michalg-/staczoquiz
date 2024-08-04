class SetPlayerNamesController < ApplicationController
  def show
    unless game_session_player
      redirect_to :join
      return
    end

    render :show, locals: { player: game_session_player.player }
  end

  def update
    service = GameSessions::UpdatePlayerName.call(
      name: permitted_params[:name],
      game_session_player_id: game_session_player.id
    )

    if service.success?
      redirect_to game_path
    else
      redirect_to :join
    end
  end

  private

  def game_session_player
    @game_session_player ||= GameSessionPlayer.find_by(id: cookies[:game_session_player_id])
  end

  def permitted_params
    params.require(:player).permit(:name)
  end
end
