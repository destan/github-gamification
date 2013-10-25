class CommitFile < ActiveRecord::Base
  belongs_to :commit

  validates :filename, uniqueness: { scope: "commit_id"}
end
