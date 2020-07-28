class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.create(game_params)
    redirect_to game_path(game)
  end

  def show
    
    @game = Game.includes(:players).find_by(uuid: params[:uuid])
    if(player_uuid = session[:player_uuid])
      @player = Player.find_by(uuid: player_uuid)

      @other_players = @game.players.reject { |player| player.id == @player.id }
    else
      @player = Player.new
    end
  end

  def edit
    # TODO
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  private

    # This seems really gnarly but it's straight from the Rails API documentation
    # https://edgeapi.rubyonrails.org/classes/ActionController/Parameters.html#method-i-require
    def game_params
      params.require(:game).permit(:name).tap do |game_params|
        game_params.require(:name)
      end
    end
end
