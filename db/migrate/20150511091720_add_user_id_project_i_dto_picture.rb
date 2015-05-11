class AddUserIdProjectIDtoPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :project_id, :integer
    add_column :pictures, :user_id, :integer
  end

end
