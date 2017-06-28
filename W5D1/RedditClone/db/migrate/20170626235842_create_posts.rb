class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.string :sub_id, null: false
      t.string :author_id, null: false
      t.timestamps
    end
  end
end
