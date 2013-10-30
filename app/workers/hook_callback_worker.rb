# Worker for processing callback from a hook
class HookCallbackWorker
  @queue = :hook_callback_queue

  def self.perform(repo, commits)
    repo_obj = Repo.where("repo_id = ?", repo["id"]).first

    commits.each do |commit|
      login = commit["author"]["username"]
      github_account = GithubAccount.find_by_login(login)


      if github_account
        commit_obj = Commit.new({
          sha: commit["id"],
          message: commit["message"],
          url: commit["url"],
          repo_id: repo_obj.id,
          github_account_id: github_account.id
        })
        Resque.enqueue(CommitWorker, ) if commit_obj.save
      end

    end

  end
end