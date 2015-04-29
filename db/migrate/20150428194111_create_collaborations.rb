class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
