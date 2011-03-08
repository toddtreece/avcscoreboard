class Team < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = false
  has_many :team_members
  has_one :bot
end
