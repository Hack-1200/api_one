class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :sub_id
      t.integer :lev_id
      t.integer :levtyp_id
      t.text :body
      t.text :variants
      t.text :answer

      t.timestamps
    end
  end
end
