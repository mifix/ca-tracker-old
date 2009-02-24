class Statistic < ActiveRecord::Base
  belongs_to :player
  
  def daily_kd
    "%.3f" % (kill_diff / death_diff.to_f)
  end
  
  def self.fetch_current_statistics_for_all_players
    players = Player.find(:all)
    
    players.each do |player|
      stats, level_image = StatisticFetcher.fetch_for(player.name)
      
      last_stats = player.statistics.last
      
      new_stats = player.statistics.create( stats )
      new_stats.kill_diff  = stats[:kills].to_i - last_stats[:kills].to_i
      new_stats.death_diff = stats[:deaths].to_i - last_stats[:deaths].to_i
      new_stats.save
      
      player.level_image_url = level_image[:level_image_url]
      player.save
    end
  end
  
end
