class AddCatNameToD3CategoryProject < ActiveRecord::Migration
  def change
    add_column :d3_category_projects, :cat_name, :string
  end
end
