class Project < ActiveRecord::Base
  attr_accessible :backers, :category_id, :city_id, :funding, :goal, :title
end
