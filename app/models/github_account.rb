class GithubAccount < ActiveRecord::Base
  belongs_to :user
  has_many :repos
  has_many :commits
  has_many :commit_files, :through => :commits
  has_many :commit_points, :through => :commits


  def language_point(language_name)
    self.commit_points.joins(:language).where("languages.name = ?", language_name).sum(:point)
  end

end
