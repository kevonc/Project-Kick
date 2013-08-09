class ChangeTotalFundingColumnToString < ActiveRecord::Migration
  def change
    change_column :d3_category_fundings, :total_funding, :string
  end
end
