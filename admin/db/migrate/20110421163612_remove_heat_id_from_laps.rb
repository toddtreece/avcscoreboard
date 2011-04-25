class RemoveHeatIdFromLaps < ActiveRecord::Migration
  def self.up
    remove_column :laps, :heats_id
  end

  def self.down
    add_column :laps, :heats_id, :integer
  end
end
