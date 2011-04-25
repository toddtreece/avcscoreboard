class AddPassToBots < ActiveRecord::Migration
  def self.up
    add_column :bots, :pass, :boolean
  end

  def self.down
    remove_column :bots, :pass
  end
end
