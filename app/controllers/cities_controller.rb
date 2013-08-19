class CitiesController < ApplicationController
  def index
    @cities = City.all
    expires_in 10.minutes, public: true
  end

  def totalprojects
    @cities = City.all
    expires_in 10.minutes, public: true
    respond_to do |format|
      format.json {render :json => @cities }
    end
  end

  def totalfunding
    @cities = City.all
    expires_in 10.minutes, public: true
    respond_to do |format|
      format.json {render :json => @cities }
    end
  end
end