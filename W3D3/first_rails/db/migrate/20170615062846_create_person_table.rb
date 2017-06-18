class CreatePersonTable < ActiveRecord::Migration[5.0]
  def change
    create_table :person do |t|
      t.string :name, null: false
      # t.integer :house_id, null:false
      t.timestamp null: false
    end
  end
end
