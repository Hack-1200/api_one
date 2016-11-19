class CreateTaskTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :task_types do |t|
      t.string :name
      t.references :subject, foreign_key: true

      t.timestamps
    end
    # add_index :task_types, [:subject_id]
  end
end
