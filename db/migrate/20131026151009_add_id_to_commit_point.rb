class AddIdToCommitPoint < ActiveRecord::Migration
  def change
    add_column :commit_points, :id, :primary_key
  end
end
