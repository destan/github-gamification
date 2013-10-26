class CommitWorker
  @queue = :commit_queue

  def self.perform(commit, repo, repo_owner)
    commit_details = $gdp.get_commit(commit["sha"], repo, repo_owner)
    files = commit_details.files

    files.each do |file|
      commit_file = CommitFile.new
      commit_file.filename = file.filename
      commit_file.additions = file.additions
      commit_file.deletions = file.deletions
      commit_file.changed_lines = file.changes
      commit_file.commit_id  = commit["id"]
      commit_file.save
    end
  end
end