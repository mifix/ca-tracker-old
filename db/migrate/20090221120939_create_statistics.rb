class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.integer :player_id
      t.integer :experience
      t.integer :rank
      t.float :kd_ratio
      t.integer :gear_points

      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end
