class AddLatitudeAndLongitudeToCity < ActiveRecord::Migration
  def change
    add_column :cities, :latitude, :float, default: 0
    add_column :cities, :longitude, :float, default: 0
  end
end