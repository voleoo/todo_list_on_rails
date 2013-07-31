class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :position
      t.boolean :done
      t.integer :project_id

      t.timestamps
    end
  end
end
