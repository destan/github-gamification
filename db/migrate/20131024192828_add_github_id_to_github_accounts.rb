class AddGithubIdToGithubAccounts < ActiveRecord::Migration
  def change
    add_column :github_accounts, :github_id, :integer
  end
end
