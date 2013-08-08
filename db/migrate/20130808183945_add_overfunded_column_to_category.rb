class AddOverfundedColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :average_overfunded_percentage, :string
  end
end
