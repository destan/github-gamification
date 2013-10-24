json.array!(@commits) do |commit|
  json.extract! commit, :sha, :url, :message, :repo_id
  json.url commit_url(commit, format: :json)
end
