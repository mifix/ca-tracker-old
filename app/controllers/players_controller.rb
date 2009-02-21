class PlayersController < ApplicationController
  
  def index
    @players = Player.find(:all)
  end
  
end
