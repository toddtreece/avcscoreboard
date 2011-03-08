class Lap < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = false
  belongs_to :heat
  belongs_to :bot
end
