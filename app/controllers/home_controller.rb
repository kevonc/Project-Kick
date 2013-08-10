class HomeController < ApplicationController
  def about
    @projects = Project.all
    @categories = Category.all
    @cities = City.all
  end
end