class RemoveViewActive < ActiveRecord::Migration
  def self.up
    remove_column :views, :active
  end

  def self.down
    add_column :views, :active, :boolean
  end
end
