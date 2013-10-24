json.array!(@repos) do |repo|
  json.extract! repo, :name, :full_name, :description, :owner, :github_account_id
  json.url repo_url(repo, format: :json)
end
