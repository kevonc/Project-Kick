class Project < ActiveRecord::Base
  belongs_to :city
  belongs_to :category
  attr_accessible :backers, :category_id, :city_id, :funding, :goal, :title, :expired, :overfunded

  validates :title, presence: true, uniqueness: true
end
