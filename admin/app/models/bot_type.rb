class BotType < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = false
  has_many :bots
end
