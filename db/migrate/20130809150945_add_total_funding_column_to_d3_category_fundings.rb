class AddTotalFundingColumnToD3CategoryFundings < ActiveRecord::Migration
  def change
    add_column :d3_category_fundings, :total_funding, :integer
  end
end
