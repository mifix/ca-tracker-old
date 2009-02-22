require 'scrubyt'

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
      
      lvl '//span[@class="level"]' do
        images '//img' do
          level_image_url "src", :type => :attribute 
        end
      end
    end.to_hash
 
    # Remove formatting of numbers
    data[0][:experience].gsub!(/,/, '')
    data[0][:gear_points].gsub!(/,/, '')
    data[0][:rank].gsub!(/,/, '')
    
    data
  end
end
