class GithubAccount < ActiveRecord::Base
  belongs_to :user
  has_many :repos
  has_many :commits, :through => :repos
  has_many :commit_files, :through => :commits

end
