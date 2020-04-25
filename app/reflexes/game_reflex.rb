class GameReflex < ApplicationReflex
  include CableReady::Broadcaster

  def set_players(data)
    game = Game.includes(:players).find_by(uuid: data["game_uuid"])

    @other_players = game.players.reject { |player| player.uuid == data["player_uuid"] }
  end
end
