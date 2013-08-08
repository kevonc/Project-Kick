class RenameAverageOverfundedPercentageColumn < ActiveRecord::Migration
  def change
    rename_column :categories, :average_overfunded_percentage, :project_overfunded_percentages
  end
end
