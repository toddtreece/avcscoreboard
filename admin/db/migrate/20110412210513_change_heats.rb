class ChangeHeats < ActiveRecord::Migration
  def self.up
    remove_column :heats, :starttime
    add_column :bots, :heats_id, :integer
  end

  def self.down
    remove_column :bots, :heats_id
    add_column :heats, :starttime, :timestamp
  end
end
