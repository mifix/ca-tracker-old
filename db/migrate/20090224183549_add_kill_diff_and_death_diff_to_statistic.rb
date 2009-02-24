class AddKillDiffAndDeathDiffToStatistic < ActiveRecord::Migration
  def self.up
    add_column :statistics, :kill_diff, :integer,  :default => 1
    add_column :statistics, :death_diff, :integer, :default => 1
    
  end

  def self.down
    remove_column :statistics, :death_diff
    remove_column :statistics, :kill_diff
  end
end
