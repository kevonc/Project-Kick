class AddMainCategorytoCategories < ActiveRecord::Migration
  def change
    add_column :categories, :main_category, :string
  end
end
