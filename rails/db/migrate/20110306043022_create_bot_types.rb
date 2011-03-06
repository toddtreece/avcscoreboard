class CreateBotTypes < ActiveRecord::Migration
  def self.up
    create_table :bot_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :bot_types
  end
end
