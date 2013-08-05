class AddOverfundedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :overfunded, :integer, default: 0
  end
end
