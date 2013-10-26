class Repo < ActiveRecord::Base
  belongs_to :github_account
  has_many :commits, :dependent => :destroy
  has_many :commit_files, :through => :commits
  has_many :commit_points, :through => :commits

  validates :repo_id, uniqueness: true
end
