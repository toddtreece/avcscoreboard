class CreateTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :team_members do |t|
      t.string :firstname
      t.string :lastname
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :team_members
  end
end
