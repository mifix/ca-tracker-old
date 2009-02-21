class PlayersController < ApplicationController
  def index
    @players = Player.find(:all)
  end
  
  def show
    @player = Player.find(params[:id])
  end
end
