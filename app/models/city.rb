class City < ActiveRecord::Base
  has_many :projects
  attr_accessible :name, :total_projects, :total_funding, :latitude, :longitude
end
