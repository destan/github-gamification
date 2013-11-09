class ParseUserActivityWorker
  @queue = :parse_user_activity

  def self.perform(user_id)
    user = User.find(user_id)
    github_account = user.github_account
    events = $gdp.github_api.user_public_events(github_account.login)

    last_parsed_event_id = nil
    events.each do |event|
      if event.id == github_account.last_parsed_event_id
        break
      else
        if event.type == "PushEvent" && github_account.login == event.actor["login"] #Check for Push and Committer
          event.payload.commits.each do |commit|
            sha = commit["sha"]
            repo_owner, repo_name = event.repo.split('/')
            commit_obj = Commit.create!(:sha => sha, :github_account => github_account) #Add commit to database
            Resque.enqueue(CommitWorker, commit_obj, repo_name, repo_owner)
            last_parsed_event_id = event.id
          end
        end
      end
    end

    github_account.update_attribute("last_parsed_event_id", last_parsed_event_id) #update last parsed event id
  end
end