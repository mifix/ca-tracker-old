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

      stats '//ul[@class="record con-high"]' do
        kills '/li[1]/span[1]'
        deaths '/li[2]/span[1]'
      end
      
    end.to_hash
 
    data[0][:kills] = data[2][:kills]
    data[0][:deaths] = data[2][:deaths]
    # TODO: Fixx this sh..
    3.times { data.pop }
 
    # Remove formatting of numbers
    data[0][:experience].gsub!(/,/, '')
    data[0][:gear_points].gsub!(/,/, '')
    data[0][:rank].gsub!(/,/, '')
    data[0][:kills].gsub!(/,/, '')
    data[0][:deaths].gsub!(/,/, '')
    
    data
  end
end
