class JoinsController < ApplicationController

  def show
    render :show, locals: { game_session: GameSession.new }
  end

  def create
    service = GameSessions::AddPlayer.call(
      code: game_session_params[:code]
    )

    if service.success?
      cookies[:game_session_player_id] = {
        value: service.result[:game_session_player_id],
        expires: 1.week.from_now
      }

      redirect_to :set_player_name
    else
      redirect_to join_path
    end

  end

  private

  def game_session_params
    params.require(:game_session).permit(:code)
  end
end
