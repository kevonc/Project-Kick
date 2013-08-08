class AddHstoreIndexToSubcatInD3CatFunding < ActiveRecord::Migration
  def change
    add_hstore_index :d3_category_fundings, :sub_cat
  end
end
