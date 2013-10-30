# Worker for creating web hook in given repo
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
             :url => ENV['GITHUB_HOOK_URL'],
             :content_type => 'json'
           },
           {
             :events => ['push'],
             :active => true
           }
       )

  end
end