class City < ActiveRecord::Base
  has_many :projects
  attr_accessible :name, :total_projects, :total_funding, :latitude, :longitude, :funding_currency
  validates :name, presence: true, uniqueness: true

end