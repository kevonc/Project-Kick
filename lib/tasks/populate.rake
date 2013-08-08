task :populate_category_projects => :environment do
  desc "Populate Category by Total Projects Table"

  def compute_total_projects(main_category)
    all = Category.find_all_by_main_category(main_category)
    number = 0
    all.each do |sub_cat|
      number += sub_cat.total_projects
    end
    return number
  end

  def find_sub_categories(main_category)
    all = Category.find_all_by_main_category(main_category)
    collector = {}
    all.each do |sub_cat|
      collector[sub_cat.name] = sub_cat.total_projects
    end
    return collector
  end

  total_projects = Project.count
  total_square = 240

  art = (total_square * compute_total_projects("Art") / total_projects)
  comics = art + (total_square * compute_total_projects("Comics") / total_projects)
  dance = comics + (total_square * compute_total_projects("Dance") / total_projects)
  design = dance + (total_square * compute_total_projects("Design") / total_projects)
  fashion = design + (total_square * compute_total_projects("Fashion") / total_projects)
  filmnvideo = fashion + (total_square * compute_total_projects("Film & Video") / total_projects)
  food = filmnvideo + (total_square * compute_total_projects("Food") / total_projects)
  games = food + (total_square * compute_total_projects("Games") / total_projects)
  music = games + (total_square * compute_total_projects("Music") / total_projects)
  photography = music + (total_square * compute_total_projects("Photography") / total_projects)
  publishing = photography + (total_square * compute_total_projects("Publishing") / total_projects)
  theater = publishing + (total_square * compute_total_projects("Theater") / total_projects)
  technology = total_square

  run = 0
  x_counter = 0
  y_counter = 0
  y_stop = 226

  while run < 240
  x = 2 + (x_counter * 32)
  y = 2 + (y_counter * 32)

  case run
    when 0..(art - 1)
      cat_name = "Arts"
      color = "#fc6a6a"
      sub_cat = find_sub_categories("Art")
    when art..(comics - 1)
      cat_name = "Comics"
      color = "#fcb26a"
      sub_cat = find_sub_categories("Comics")
    when comics..(dance - 1)
      cat_name = "Dance"
      color = "#fce26a"
      sub_cat = find_sub_categories("Dance")
    when dance..(design - 1)
      cat_name = "Design"
      color = "#c0fc6a"
      sub_cat = find_sub_categories("Design")
    when design..(fashion - 1)
      cat_name = "Fashion"
      color = "#6afc89"
      sub_cat = find_sub_categories("Fashion")
    when fashion..(filmnvideo - 1)
      cat_name = "Film & Video"
      color = "#6afce6"
      sub_cat = find_sub_categories("Film & Video")
    when filmnvideo..(food - 1)
      cat_name = "Food"
      color = "#6abcfc"
      sub_cat = find_sub_categories("Food")
    when food..(games - 1)
      cat_name = "Games"
      color = "#6a7efc"
      sub_cat = find_sub_categories("Games")
    when games..(music - 1)
      cat_name = "Music"
      color = "#896afc"
      sub_cat = find_sub_categories("Music")
    when music..(photography - 1)
      cat_name = "Photography"
      color = "#ca6afc"
      sub_cat = find_sub_categories("Photography")
    when photography..(publishing - 1)
      cat_name = "Publishing"
      color = "#fc6adf"
      sub_cat = find_sub_categories("Publishing")
    when publishing..(theater - 1)
      cat_name = "Theater"
      color = "#fc6a93"
      sub_cat = find_sub_categories("Theater")
    when theater..(technology - 1)
      cat_name = "Technology"
      color = "#fc6a6a"
      sub_cat = find_sub_categories("Technology")
    else
      color = "#ffffff"
  end

    populate = D3CategoryProject.create(x: x, y: y, color: color, cat_name: cat_name, sub_cat: sub_cat)
    y_counter += 1

    if y == y_stop
      x_counter += 1
      y_counter = 0
    end
    run += 1
  end
end

task :populate_category_funding => :environment do
  desc "Populate Category by Total Funding Table"

  def compute_total_funding(main_category)
    all = Category.find_all_by_main_category(main_category)
    number = 0
    all.each do |sub_cat|
      number += sub_cat.total_funding
    end
    return number
  end

  def find_sub_categories(main_category)
    all = Category.find_all_by_main_category(main_category)
    collector = {}
    all.each do |sub_cat|
      collector[sub_cat.name] = sub_cat.total_funding
    end
    return collector
  end

  categories = Category.all
  overall_funding = 0
  categories.each do |cat|
    overall_funding += cat.total_funding
  end

  total_square = 240

  art = (total_square * compute_total_funding("Art") / overall_funding)
  comics = art + (total_square * compute_total_funding("Comics") / overall_funding)
  dance = comics + (total_square * compute_total_funding("Dance") / overall_funding)
  design = dance + (total_square * compute_total_funding("Design") / overall_funding)
  fashion = design + (total_square * compute_total_funding("Fashion") / overall_funding)
  filmnvideo = fashion + (total_square * compute_total_funding("Film & Video") / overall_funding)
  food = filmnvideo + (total_square * compute_total_funding("Food") / overall_funding)
  games = food + (total_square * compute_total_funding("Games") / overall_funding)
  music = games + (total_square * compute_total_funding("Music") / overall_funding)
  photography = music + (total_square * compute_total_funding("Photography") / overall_funding)
  publishing = photography + (total_square * compute_total_funding("Publishing") /  overall_funding)
  theater = publishing + (total_square * compute_total_funding("Theater") / overall_funding)
  technology = total_square

  run = 0
  x_counter = 0
  y_counter = 0
  y_stop = 226

  while run < 240
  x = 2 + (x_counter * 32)
  y = 2 + (y_counter * 32)

  case run
    when 0..(art - 1)
      cat_name = "Arts"
      color = "#fc6a6a"
      sub_cat = find_sub_categories("Art")
    when art..(comics - 1)
      cat_name = "Comics"
      color = "#fcb26a"
      sub_cat = find_sub_categories("Comics")
    when comics..(dance - 1)
      cat_name = "Dance"
      color = "#fce26a"
      sub_cat = find_sub_categories("Dance")
    when dance..(design - 1)
      cat_name = "Design"
      color = "#c0fc6a"
      sub_cat = find_sub_categories("Design")
    when design..(fashion - 1)
      cat_name = "Fashion"
      color = "#6afc89"
      sub_cat = find_sub_categories("Fashion")
    when fashion..(filmnvideo - 1)
      cat_name = "Film & Video"
      color = "#6afce6"
      sub_cat = find_sub_categories("Film & Video")
    when filmnvideo..(food - 1)
      cat_name = "Food"
      color = "#6abcfc"
      sub_cat = find_sub_categories("Food")
    when food..(games - 1)
      cat_name = "Games"
      color = "#6a7efc"
      sub_cat = find_sub_categories("Games")
    when games..(music - 1)
      cat_name = "Music"
      color = "#896afc"
      sub_cat = find_sub_categories("Music")
    when music..(photography - 1)
      cat_name = "Photography"
      color = "#ca6afc"
      sub_cat = find_sub_categories("Photography")
    when photography..(publishing - 1)
      cat_name = "Publishing"
      color = "#fc6adf"
      sub_cat = find_sub_categories("Publishing")
    when publishing..(theater - 1)
      cat_name = "Theater"
      color = "#fc6a93"
      sub_cat = find_sub_categories("Theater")
    when theater..(technology - 1)
      cat_name = "Technology"
      color = "#fc6a6a"
      sub_cat = find_sub_categories("Technology")
    else
      color = "#ffffff"
  end

  populate = D3CategoryFunding.create(x: x, y: y, color: color, cat_name: cat_name, sub_cat: sub_cat)
    y_counter += 1

    if y == y_stop
      x_counter += 1
      y_counter = 0
    end
    run += 1
  end
end
