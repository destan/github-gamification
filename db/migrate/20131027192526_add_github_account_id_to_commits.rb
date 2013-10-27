class AddGithubAccountIdToCommits < ActiveRecord::Migration
  def change
    add_column :commits, :github_account_id, :integer
  end
end
