class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def totalprojects
    @categories = Category.all

    respond_to do |format|
      format.json {render :json => @categories }
    end
  end
end