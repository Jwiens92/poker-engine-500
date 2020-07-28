class PlayersController < ApplicationController
  include CableReady::Broadcaster

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
    binding.pry
    session[:player_uuid] = player.uuid

    dispatch_player_joined_notification

    redirect_to game_path(game)
  end

  private

    def player_params
      params.require(:player).permit(:username).tap do |player_params|
        player_params.require(:username)
      end
    end

    # TODO: For some reason this causes the "current player" to be reset to whoever triggered the event. Please fix.
    # TODO: Limit this somehow to broadcast only to games where the player joined
    def dispatch_player_joined_notification
      cable_ready["StimulusReflex::Channel"].dispatch_event(
        name: "reload:players"
      )
      cable_ready.broadcast
    end
end
