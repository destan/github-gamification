class Language < ActiveRecord::Base
  has_many :commit_points
  has_many :commits, :through => :commit_points
end
