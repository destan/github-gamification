class CommitPoint < ActiveRecord::Base
  belongs_to :language
  belongs_to :commit

end
