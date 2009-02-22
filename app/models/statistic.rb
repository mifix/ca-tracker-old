class Statistic < ActiveRecord::Base
  belongs_to :player
  
  def self.fetch_current_statistics_for_all_players
    players = Player.find(:all)
    
    players.each do |player|
      stats, level_image = StatisticFetcher.fetch_for(player.name)
      player.statistics.create( stats )
      player.level_image_url = level_image[:level_image_url]
      player.save
    end
  end
  
end
