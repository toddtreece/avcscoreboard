class ChangeLapBonusLandLot < ActiveRecord::Migration
  def self.up
    remove_column :laps, :bonus_landlot
    add_column :laps, :bonus_landlot, :boolean
  end

  def self.down
    remove_column :laps, :bonus_landlot
    add_column :laps, :bonus_landlot, :integer
  end
end
