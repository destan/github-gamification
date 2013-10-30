# Worker for processing new registration
class NewUserWorker
  @queue = :user_queue

  def self.perform(*args)
    ap args
    repos = $gdp.get_user_repos(args[0]["login"])

    repos.each do |repo|
      repo_obj = Repo.new
      repo_obj.name = repo.name
      repo_obj.full_name = repo.full_name
      repo_obj.description = repo.description
      repo_obj.owner = repo.owner.login
      repo_obj.github_account_id = args[0]["id"]
      repo_obj.repo_id = repo.id
      Resque.enqueue(HookWorker, repo_obj.github_account, repo_obj) if repo_obj.save
      #Resque.enqueue(RepoWorker, args[0], repo_obj) if repo_obj.save
      break
    end
  end

end