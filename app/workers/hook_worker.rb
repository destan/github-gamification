class HookWorker
  @queue = :hook_queue

  def self.perform(github_account, repo)

    # Creating hooks needs authentication
    client = GithubDataParser.new({
      :access_token => github_account["token"]
    })

    client.github_api.create_hook(
            repo["full_name"],
           'web',
           {
             :url => "http://176.42.84.93:3000/hooks/track",
             :content_type => 'json'
           },
           {
             :events => ['push'],
             :active => true
           }
       )

  end
end