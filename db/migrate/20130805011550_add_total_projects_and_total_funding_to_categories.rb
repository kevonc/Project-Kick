class AddTotalProjectsAndTotalFundingToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :total_projects, :integer, default: 0
    add_column :categories, :total_funding, :integer, default: 0
  end
end
