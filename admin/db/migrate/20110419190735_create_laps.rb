class CreateLaps < ActiveRecord::Migration
  def self.up
    create_table :laps do |t|
      t.integer :bots_id
      t.integer :heats_id
      t.time :lap_time
      t.integer :corners_completed
      t.boolean :disqualified
      t.boolean :bonus_landbox
      t.integer :bonus_landlot
      t.boolean :bonus_takeoff
      t.boolean :bonus_ring

      t.timestamps
    end
  end

  def self.down
    drop_table :laps
  end
end
