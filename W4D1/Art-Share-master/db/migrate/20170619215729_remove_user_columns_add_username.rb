class RemoveUserColumnsAddUsername < ActiveRecord::Migration[5.0]
  def change
    remove_columns(:users, :name, :email)
    add_column(:users, :username, :string, unique: true, null: false)
  end
end
