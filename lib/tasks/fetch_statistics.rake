desc "Fetch current stats for all players"
task :fetch_statistics => :environment do
  Statistic.fetch_current_statistics_for_all_players
end