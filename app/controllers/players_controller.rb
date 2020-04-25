class PlayersController < ApplicationController
  def create
    game = Game.find_by(uuid: params[:game_uuid])

    if game.nil?
      # TODO: Add game not found method? Or use a 404 page instead?
      return redirect_to root_path
    end

    player = Player.new(player_params)
    player.games = [game]
    player.save!

    # TODO: Pull out player session management into a service
    session[:player_uuid] = player.uuid

    redirect_to game_path(game)
  end

  private

    def player_params
      params.require(:player).permit(:username).tap do |player_params|
        player_params.require(:username)
      end
    end
end
