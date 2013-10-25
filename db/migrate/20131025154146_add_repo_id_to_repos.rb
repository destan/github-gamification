class AddRepoIdToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :repo_id, :integer
  end
end
