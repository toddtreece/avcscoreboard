class CreateAwards < ActiveRecord::Migration
  def self.up
    create_table :awards do |t|
      t.integer :teams_id
      t.integer :award
      t.string :judge

      t.timestamps
    end
  end

  def self.down
    drop_table :awards
  end
end
