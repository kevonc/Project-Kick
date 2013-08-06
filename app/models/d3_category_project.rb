class D3CategoryProject < ActiveRecord::Base
  attr_accessible :x, :y, :color, :sub_cat, :cat_name

  serialize :sub_cat, ActiveRecord::Coders::Hstore
end
