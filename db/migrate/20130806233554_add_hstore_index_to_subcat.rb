class AddHstoreIndexToSubcat < ActiveRecord::Migration
  def change
    add_hstore_index :d3_category_projects, :sub_cat
  end
end
