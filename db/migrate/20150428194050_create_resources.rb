class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
