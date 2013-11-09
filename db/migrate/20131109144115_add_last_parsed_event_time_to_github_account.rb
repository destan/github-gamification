class AddLastParsedEventTimeToGithubAccount < ActiveRecord::Migration
  def change
    add_column :github_accounts, :last_parsed_event_time, :datetime
  end
end
