require 'scrubyt'
require 'pp'

class StatisticFetcher
  
  def self.fetch_for(player_name)

    data = Scrubyt::Extractor.define do
      fetch "http://combatarms.nexoneu.com/Modules/Community/Profile/Profile.aspx?NickName=#{player_name}"

      profile_info  '//dl[@class="default"]' do
        rank        '/dd[3]'
        kd_ratio    '/dd[4]'
        experience  '/dd[5]'
        gear_points '/dd[6]'
      end
    end.to_hash.shift

    # Remove formatting of numbers
    data[:experience].gsub!(/,/, '')
    data[:gear_points].gsub!(/,/, '')
    data[:rank].gsub!(/,/, '')

    data
  end
  
end

