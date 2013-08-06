class D3CategoryByProjects < ActiveRecord::Migration
  def change
    create_table :d3_category_projects do |t|
      t.integer :x
      t.integer :y
      t.string :color
      t.string :id
      t.string :subcat
    end
  end
end