class ChangeUserNametoUnique < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, null: false, default: ""
  end
  add_index :users, :name, unique: true
end
