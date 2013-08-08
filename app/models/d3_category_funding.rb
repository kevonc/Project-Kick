class D3CategoryFunding < ActiveRecord::Base
  attr_accessible :x, :y, :color, :sub_cat, :cat_name

  serialize :sub_cat, ActiveRecord::Coders::Hstore
end
