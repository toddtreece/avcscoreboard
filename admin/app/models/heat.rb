class Heat < ActiveRecord::Base
  has_many :laps
  belongs_to :bot_type
end
