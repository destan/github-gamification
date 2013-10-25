class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :name
      t.string :extensions
      t.float :ratio

      t.timestamps
    end
  end
end
