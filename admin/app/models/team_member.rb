class TeamMember < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = false
  belongs_to :team
end
