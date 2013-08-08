class D3CategoryByFunding < ActiveRecord::Migration
  def change
    create_table :d3_category_fundings do |t|
      t.integer :x
      t.integer :y
      t.string :color
      t.string :cat_name
      t.hstore :sub_cat
    end
  end
end