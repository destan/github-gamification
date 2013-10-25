class Commit < ActiveRecord::Base
  belongs_to :repo
  has_many :commit_files
  has_many :commit_points
  has_many :languages, :through => :commit_points

  validates :sha, :uniqueness => true
end
