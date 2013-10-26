class CommitPoint < ActiveRecord::Base
  default_scope { order('commit_id DESC') }

  belongs_to :language
  belongs_to :commit

end
