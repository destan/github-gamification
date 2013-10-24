class CreateCommitFiles < ActiveRecord::Migration
  def change
    create_table :commit_files do |t|
      t.string :filename
      t.integer :additions
      t.integer :deletions
      t.integer :changed_lines
      t.integer :commit_id

      t.timestamps
    end
  end
end
