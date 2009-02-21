class Statistic < ActiveRecord::Base
  belongs_to :player
  
  def self.fetch_current_statistics_for_all_players
    players = Player.find(:all)
    
    players.each do |player|
      player.statistics.create( StatisticFetcher.fetch_for(player.name) )
    end
  end
  
end
