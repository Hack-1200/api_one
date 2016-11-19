class CreateTypeTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :type_tasks do |t|
      t.text :name
      t.integer :subject_id

      t.timestamps
    end
  end
end
