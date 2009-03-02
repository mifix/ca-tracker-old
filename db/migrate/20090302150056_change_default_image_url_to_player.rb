class ChangeDefaultImageUrlToPlayer < ActiveRecord::Migration
  def self.up
    change_column :players, :level_image_url, :string, :default => 'rank_0.gif'
  end

  def self.down
  end
end
