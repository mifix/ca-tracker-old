class Statistic < ActiveRecord::Base
  belongs_to :player
  
  def daily_kd
    "%.3f" % (kill_diff / death_diff.to_f)
  end
  
  def self.fetch_current_statistics_for_all_players
    players = Player.find(:all)
    
    players.each do |player|
      stats, level_image = StatisticFetcher.fetch_for(player.name)
      
      # retrieve the latest stats to calculate daily k/d
      last_stats = player.statistics.last
      
      new_stats = player.statistics.create( stats )
      new_stats.calculate_kill_and_death_differences(last_stats)
      new_stats.save
      
      player.level_image_url = level_image[:level_image_url]
      player.save
    end
  end
  
  def calculate_kill_and_death_differences(last_stats)
    if last_stats.nil?
      self.kill_diff = self.kills
      self.death_diff = self.deaths
    else
      self.kill_diff  = self.kills  - last_stats[:kills].to_i
      self.death_diff = self.deaths - last_stats[:deaths].to_i
    end
  end
  
end
