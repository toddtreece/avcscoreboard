class Heat < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = false
  has_many :laps
  belongs_to :bot_type
end
