class AddTitleToResources < ActiveRecord::Migration
  def change
    add_column :resources, :title, :string    #adding a new column called title as a string datatype
  end
end
