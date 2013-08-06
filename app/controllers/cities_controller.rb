class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def totalprojects
    @cities = City.all
    respond_to do |format|
      format.json {render :json => @cities }
    end
  end

  def totalfunding
    @cities = City.all
    respond_to do |format|
      format.json {render :json => @cities }
    end
  end

  def chart
    @categories = Category.all
    respond_to do |format|
      format.json {render :json => @categories }
    end
  end
end