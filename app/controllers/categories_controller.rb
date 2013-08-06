class CategoriesController < ApplicationController
  def index
  end

  def totalprojects
  #   def compute_total_projects(main_category)
  #     all = Category.find_all_by_main_category(main_category)
  #     number = 0
  #     all.each do |sub_cat|
  #       number += sub_cat.total_projects
  #     end
  #     return number
  #   end

  #   art = compute_total_projects("Art")
  #   comics = compute_total_projects("Comics")
  #   dance = compute_total_projects("Dance")
  #   design = compute_total_projects("Design")
  #   fashion = compute_total_projects("Fashion")
  #   filmnvideo = compute_total_projects("Film & Video")
  #   food = compute_total_projects("Food")
  #   games = compute_total_projects("Games")
  #   music = compute_total_projects("Music")
  #   photography = compute_total_projects("Photography")
  #   publishing = compute_total_projects("Publishing")
  #   technology = compute_total_projects("Technology")
  #   theater = compute_total_projects("Theater")

  #   total_projects = Project.count
  #   total_square = 240


  #   @categories_sq = {
  #     "Art" => (total_square * art / total_projects),
  #     "Comics" => (total_square * comics / total_projects),
  #     "Dance" => (total_square * dance / total_projects),
  #     "Design" => (total_square * design / total_projects),
  #     "Fashion" => (total_square * fashion / total_projects),
  #     "Film & Video" => (total_square * filmnvideo / total_projects),
  #     "Food" => (total_square * food / total_projects),
  #     "Games" => (total_square * games / total_projects),
  #     "Music" => (total_square * music / total_projects),
  #     "Photography" => (total_square * photography / total_projects),
  #     "Publishing" => (total_square * publishing / total_projects),
  #     "Theater" => (total_square * theater / total_projects),
  #     "Technology" => (total_square - (total_square * (art + comics + dance + design + fashion + filmnvideo + food + games + music + photography + publishing + theater) / total_projects))
  #   }

  #   # this is gonna be a rake task
  #   # and then i will just call all data in db as an object and pass in
  @categories_sq = [{"x" => 2, "y" => 2, "color" => "#318a6c"},
                    {"x" => 2, "y" => 34, "color" => "#b02e30"},
                    {"x" => 194, "y" => 2, "color" => "#b02e30"},
                    {"x" => 770, "y" => 130, "color" => "#b02e30"}



                  ]

    respond_to do |format|
      format.json {render :json => @categories_sq }
    end
  end

end