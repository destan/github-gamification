class CreateGithubAccounts < ActiveRecord::Migration
  def change
    create_table :github_accounts do |t|
      t.string :login
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
