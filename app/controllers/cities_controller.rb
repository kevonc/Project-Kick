class CitiesController < ApplicationController
  def index

  end

  def totalprojects
    @cities = City.all
    respond_to do |format|
      format.json {render :json => @cities }
    end
  end
end