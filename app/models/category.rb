class Category < ActiveRecord::Base
  has_many :projects
  attr_accessible :name
  validates :name, presence: true, uniqueness: true

  serialize :project_overfunded_percentages
end