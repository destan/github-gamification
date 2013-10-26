class Commit < ActiveRecord::Base
  belongs_to :repo
  has_many :commit_files, :dependent => :destroy
  has_many :commit_points, :dependent => :destroy
  has_many :languages, :through => :commit_points

  validates :sha, :uniqueness => true
end
