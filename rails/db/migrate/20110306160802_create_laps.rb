class CreateLaps < ActiveRecord::Migration
  def self.up
    create_table :laps do |t|
      t.integer :bots_id
      t.time :lap_time
      t.integer :corners_completed
      t.boolean :disqualified
      t.integer :heats_id

      t.timestamps
    end
  end

  def self.down
    drop_table :laps
  end
end
