class CreateHouseTable < ActiveRecord::Migration[5.0]
  def change
    create_table :house do |t|
      t.string :address, null: false
      t.timestamp null: false
    end
  end
end
