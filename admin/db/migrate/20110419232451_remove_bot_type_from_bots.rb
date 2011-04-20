class RemoveBotTypeFromBots < ActiveRecord::Migration
  def self.up
    remove_column :bots, :bot_types_id
  end

  def self.down
    add_column :bots, :bot_types_id, :integer
  end
end
