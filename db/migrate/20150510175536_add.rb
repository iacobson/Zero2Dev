class Add < ActiveRecord::Migration
  def change
    add_column :projects, :repository, :string
    add_column :projects, :website, :string
  end
end
