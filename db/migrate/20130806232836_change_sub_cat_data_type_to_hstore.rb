class ChangeSubCatDataTypeToHstore < ActiveRecord::Migration
  def change
    add_column :d3_category_projects, :sub_cat, :hstore
  end
end
