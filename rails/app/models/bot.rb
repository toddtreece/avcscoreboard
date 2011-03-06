class Bot < ActiveRecord::Base
  has_many :laps
  belongs_to :bot_type
  belongs_to :team
end
