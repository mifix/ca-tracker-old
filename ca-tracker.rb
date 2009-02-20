#!/usr/bin/env ruby -KU

require 'scrubyt'
require "pp"


nickname = ''

data = Scrubyt::Extractor.define do
  fetch "http://combatarms.nexoneu.com/Modules/Community/Profile/Profile.aspx?NickName=#{nickname}"
  
  profile_info '//dl[@class="default"]' do
    ranking   '/dd[3]'
    kd_ratio  '/dd[4]'
    exp       '/dd[5]'
    gp        '/dd[6]'
  end
  
end

pp data.to_hash