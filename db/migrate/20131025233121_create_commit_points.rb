class CreateCommitPoints < ActiveRecord::Migration
  def change
    create_table :commit_points, id: false do |t|
      t.integer :commit_id
      t.integer :language_id
      t.float :point

      t.timestamps
    end

    add_index :commit_points, [:commit_id, :language_id]

  end
end
