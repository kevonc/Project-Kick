class CategoriesController < ApplicationController
  def index
  end

  def totalprojects
    @categories = D3CategoryProject.all

    respond_to do |format|
      format.json { render :json => @categories }
    end
  end

  def totalfunding
    @categories = D3CategoryFunding.all

    respond_to do |format|
      format.json { render :json => @categories }
    end
  end

  def funding
      @overfunded_average = average_overfunded_hash

    respond_to do |format|
      format.html
      format.json {render :json => @overfunded_average}
    end
  end
end

def average_overfunded_hash
  overfunded = []
  categories = Category.all
  categories.each do |category|
    sum = category.project_overfunded_percentages.inject(:+)
    average = sum/(category.project_overfunded_percentages).length
    cat_temp = {}
    cat_temp[:name] = category.name
    cat_temp[:percentage] = average.round(2)
    overfunded << cat_temp
  end
  overfunded
end