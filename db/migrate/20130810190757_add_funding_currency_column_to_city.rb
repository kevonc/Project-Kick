class AddFundingCurrencyColumnToCity < ActiveRecord::Migration
  def change
    add_column :cities, :funding_currency, :string
  end
end
