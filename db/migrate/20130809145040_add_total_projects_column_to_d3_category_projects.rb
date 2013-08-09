class AddTotalProjectsColumnToD3CategoryProjects < ActiveRecord::Migration
  def change
    add_column :d3_category_projects, :total_projects, :integer
  end
end
