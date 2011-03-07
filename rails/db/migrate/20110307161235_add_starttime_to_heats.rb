class AddStarttimeToHeats < ActiveRecord::Migration
  def self.up
    add_column :heats, :starttime, :timestamp
  end

  def self.down
    remove_column :heats, :starttime
  end
end
