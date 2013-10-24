class RepoWorker
  @queue = :repo_queue

  def self.perform(github_account, repo)
    commits = $gdp.get_user_commits(github_account["login"], repo["name"], repo["owner"] )
    commits.each do |commit|
      commit_obj = Commit.new
      commit_obj.sha = commit.sha
      commit_obj.repo_id = repo["id"]
      Resque.enqueue(CommitWorker, commit_obj, repo["name"], repo["owner"]) if commit_obj.save
    end
  end
end