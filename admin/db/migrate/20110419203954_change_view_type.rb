class ChangeViewType < ActiveRecord::Migration
  def self.up
    add_column :views, :display_type, :integer
    remove_column :views, :type
    add_column :views, :display_type_id, :integer
    remove_column :views, :type_id
  end

  def self.down
    remove_column :views, :display_type
    add_column :views, :type, :integer
    remove_column :views, :display_type_id
    add_column :views, :type_id, :integer
  end
end
