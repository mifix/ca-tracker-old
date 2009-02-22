class AddLevelImageUrlToPlayer < ActiveRecord::Migration
  def self.up
    add_column :players, :level_image_url, :string
  end

  def self.down
    remove_column :players, :level_image_url
  end
end
