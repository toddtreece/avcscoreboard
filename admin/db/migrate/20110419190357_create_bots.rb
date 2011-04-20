class CreateBots < ActiveRecord::Migration
  def self.up
    create_table :bots do |t|
      t.string :name
      t.integer :bot_types_id
      t.integer :teams_id
      t.integer :heats_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bots
  end
end
