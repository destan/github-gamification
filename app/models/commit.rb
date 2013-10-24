class Commit < ActiveRecord::Base
  belongs_to :repo
  has_many :commit_files
end
