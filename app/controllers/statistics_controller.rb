class StatisticsController < ApplicationController
  
  def index
    @player = Player.find(params[:player_id])
    @statistics = @player.statistics
  end
  
end
