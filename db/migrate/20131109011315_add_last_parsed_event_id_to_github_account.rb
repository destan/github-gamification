class AddLastParsedEventIdToGithubAccount < ActiveRecord::Migration
  def change
    add_column :github_accounts, :last_parsed_event_id, :integer
  end
end
