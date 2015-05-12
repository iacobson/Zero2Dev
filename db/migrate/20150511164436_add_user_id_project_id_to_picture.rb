class AddUserIdProjectIdToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :user_id, :integer
    add_column :pictures, :project_id, :integer

    add_index :pictures, :user_id
    add_index :pictures, :project_id
  end
end
