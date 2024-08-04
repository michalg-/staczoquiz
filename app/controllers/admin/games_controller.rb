module Admin
  class GamesController < AdminController
    def index
      games = Game.all

      render :index, locals: { games: }
    end

    def show
      game = Game.find(params[:id])

      render :show, locals: { game: }
    end

    def edit
      game = Game.find(params[:id])

      render :edit, locals: { game: }
    end

    def update
      game = Game.find(params[:id])
      game.update(game_params)

      redirect_to admin_games_path
    end

    private

    def game_params
      params.require(:game).permit(:name)
    end
  end
end
