class AddKillsAndDeathsToStatistic < ActiveRecord::Migration
  def self.up
    add_column :statistics, :kills, :integer
    add_column :statistics, :deaths, :integer
  end

  def self.down
    remove_column :statistics, :deaths
    remove_column :statistics, :kills
  end
end
