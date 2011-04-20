class CreateHeats < ActiveRecord::Migration
  def self.up
    create_table :heats do |t|
      t.integer :bot_types_id

      t.timestamps
    end
  end

  def self.down
    drop_table :heats
  end
end
