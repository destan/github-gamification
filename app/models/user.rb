class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include Authentication::ActiveRecordHelpers

  has_one :github_account
  has_many :repos, :through => :github_account
  has_many :commits, :through => :github_account
  has_many :commit_files, :through => :commits
end
