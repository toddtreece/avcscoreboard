class CreateDisplays < ActiveRecord::Migration
  def self.up
    create_table :displays do |t|
      t.integer :type
      t.integer :type_id
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :displays
  end
end
