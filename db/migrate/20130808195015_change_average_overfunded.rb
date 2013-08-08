class ChangeAverageOverfunded < ActiveRecord::Migration
  def change
    change_column :categories, :project_overfunded_percentages, :text
  end
end
