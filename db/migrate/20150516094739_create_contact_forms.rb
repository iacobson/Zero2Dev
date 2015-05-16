class CreateContactForms < ActiveRecord::Migration
  def change
    create_table :contact_forms do |t|

      t.timestamps null: false
    end
  end
end
