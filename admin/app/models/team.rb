class Team < ActiveRecord::Base
  has_many :team_members
  has_one :bot
end
