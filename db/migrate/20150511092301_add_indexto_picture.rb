class AddIndextoPicture < ActiveRecord::Migration
  def change
    add_index :pictures, :project_id
    add_index :pictures, :user_id
  end
end
