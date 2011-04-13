class AddBonuses < ActiveRecord::Migration
  def self.up
    add_column :laps, :bonus_landbox, :boolean
    add_column :laps, :bonus_landlot, :boolean
    add_column :laps, :bonus_takeoff, :boolean
    add_column :laps, :bonus_ring, :boolean
  end

  def self.down
    remove_column :laps, :bonus_landbox
    remove_column :laps, :bonus_landlot
    remove_column :laps, :bonus_takeoff
    remove_column :laps, :bonus_ring
  end
end
