class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :full_name
      t.text :description
      t.string :owner
      t.integer :github_account_id

      t.timestamps
    end
  end
end
