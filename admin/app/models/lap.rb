class Lap < ActiveRecord::Base
  belongs_to :heat
  belongs_to :bot
end
