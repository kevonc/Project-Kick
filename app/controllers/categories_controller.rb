class CategoriesController < ApplicationController
  def index

    def compute_total_projects(main_category)
      all = Category.find_all_by_main_category(main_category)
      number = 0
      all.each do |sub_cat|
        number += sub_cat.total_projects
      end
      return number
    end

    art = compute_total_projects("Art")
    comics = compute_total_projects("Comics")
    dance = compute_total_projects("Dance")
    design = compute_total_projects("Design")
    fashion = compute_total_projects("Fashion")
    filmnvideo = compute_total_projects("Film & Video")
    food = compute_total_projects("Food")
    games = compute_total_projects("Games")
    music = compute_total_projects("Music")
    photography = compute_total_projects("Photography")
    publishing = compute_total_projects("Publishing")
    technology = compute_total_projects("Technology")
    theater = compute_total_projects("Theater")

    total_projects = Project.count
    total_square = 240

    @art_sq = Integer(art / total_projects * total_square)
    @comics_sq = Integer(comics / total_projects * total_square)
    @dance_sq = Integer(dance / total_projects * total_square)
    @design_sq = Integer(design / total_projects * total_square)
    @fashion_sq = Integer(fashion / total_projects * total_square)
    @filmnvideo_sq = Integer(filmnvideo / total_projects * total_square)
    @food_sq = Integer(food / total_projects * total_square)
    @games_sq = Integer(games / total_projects * total_square)
    @music_sq = Integer(music / total_projects * total_square)
    @photography_sq = Integer(photography / total_projects * total_square)
    @publishing_sq = Integer(publishing / total_projects * total_square)
    @theater_sq = Integer(theater / total_projects * total_square)

    # Speical Case
    @technology_sq = total_square - @art_sq - @comics_sq - @dance_sq - @design_sq - @fashion_sq
                             - @filmnvideo_sq - @food_sq - @games_sq - @music_sq - @photography_sq
                             - @publishing_sq - @theater_sq
  end

  # def totalprojects
  #   @categories = Category.all

  #   respond_to do |format|
  #     format.json {render :json => @categories }
  #   end
  # end
end