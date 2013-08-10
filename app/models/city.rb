class City < ActiveRecord::Base
  has_many :projects
  attr_accessible :name, :total_projects, :total_funding, :latitude, :longitude
  validates :name, presence: true, uniqueness: true

end