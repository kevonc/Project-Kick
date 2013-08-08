class Category < ActiveRecord::Base
  has_many :projects
  attr_accessible :name

  serialize :project_overfunded_percentages
end
