class RemoveSubcatFromCategoryProjects < ActiveRecord::Migration
  def change
    remove_column :d3_category_projects, :subcat
  end
end
