class Player < ActiveRecord::Base
  has_many :statistics
  
  def has_statistics?
    self.statistics.count > 0
  end
end

