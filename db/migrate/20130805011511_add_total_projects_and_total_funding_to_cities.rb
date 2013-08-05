class AddTotalProjectsAndTotalFundingToCities < ActiveRecord::Migration
  def change
    add_column :cities, :total_projects, :integer, default: 0
    add_column :cities, :total_funding, :integer, default: 0
  end
end
