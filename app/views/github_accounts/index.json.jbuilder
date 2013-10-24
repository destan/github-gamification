json.array!(@github_accounts) do |github_account|
  json.extract! github_account, :login, :token, :user_id
  json.url github_account_url(github_account, format: :json)
end
