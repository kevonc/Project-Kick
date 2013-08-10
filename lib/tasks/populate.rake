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

  art_projects = compute_total_projects("Art")
  comics_projects = compute_total_projects("Comics")
  dance_projects = compute_total_projects("Dance")
  design_projects = compute_total_projects("Design")
  fashion_projects = compute_total_projects("Fashion")
  filmnvideo_projects = compute_total_projects("Film & Video")
  food_projects = compute_total_projects("Food")
  games_projects = compute_total_projects("Games")
  music_projects = compute_total_projects("Music")
  photography_projects = compute_total_projects("Photography")
  publishing_projects = compute_total_projects("Publishing")
  theater_projects = compute_total_projects("Theater")
  technology_projects = compute_total_projects("Technology")

  # Number of squares needed for each category
  art = (total_square * art_projects / total_projects)
  comics = art + (total_square * comics_projects / total_projects)
  dance = comics + (total_square * dance_projects / total_projects)
  design = dance + (total_square * design_projects / total_projects)
  fashion = design + (total_square * fashion_projects / total_projects)
  filmnvideo = fashion + (total_square * filmnvideo_projects / total_projects)
  food = filmnvideo + (total_square * food_projects / total_projects)
  games = food + (total_square * games_projects / total_projects)
  music = games + (total_square * music_projects / total_projects)
  photography = music + (total_square * photography_projects / total_projects)
  publishing = photography + (total_square * publishing_projects / total_projects)
  theater = publishing + (total_square * theater_projects / total_projects)
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
      total_projects = art_projects
    when art..(comics - 1)
      cat_name = "Comics"
      color = "#fcb26a"
      sub_cat = find_sub_categories("Comics")
      total_projects = comics_projects
    when comics..(dance - 1)
      cat_name = "Dance"
      color = "#fce26a"
      sub_cat = find_sub_categories("Dance")
      total_projects = dance_projects
    when dance..(design - 1)
      cat_name = "Design"
      color = "#c0fc6a"
      sub_cat = find_sub_categories("Design")
      total_projects = design_projects
    when design..(fashion - 1)
      cat_name = "Fashion"
      color = "#6afc89"
      sub_cat = find_sub_categories("Fashion")
      total_projects = fashion_projects
    when fashion..(filmnvideo - 1)
      cat_name = "Film & Video"
      color = "#6afce6"
      sub_cat = find_sub_categories("Film & Video")
      total_projects = filmnvideo_projects
    when filmnvideo..(food - 1)
      cat_name = "Food"
      color = "#6abcfc"
      sub_cat = find_sub_categories("Food")
      total_projects = food_projects
    when food..(games - 1)
      cat_name = "Games"
      color = "#6a7efc"
      sub_cat = find_sub_categories("Games")
      total_projects = games_projects
    when games..(music - 1)
      cat_name = "Music"
      color = "#896afc"
      sub_cat = find_sub_categories("Music")
      total_projects = music_projects
    when music..(photography - 1)
      cat_name = "Photography"
      color = "#ca6afc"
      sub_cat = find_sub_categories("Photography")
      total_projects = photography_projects
    when photography..(publishing - 1)
      cat_name = "Publishing"
      color = "#fc6adf"
      sub_cat = find_sub_categories("Publishing")
      total_projects = publishing_projects
    when publishing..(theater - 1)
      cat_name = "Theater"
      color = "#fc6a93"
      sub_cat = find_sub_categories("Theater")
      total_projects = theater_projects
    when theater..(technology - 1)
      cat_name = "Technology"
      color = "#fc6a6a"
      sub_cat = find_sub_categories("Technology")
      total_projects = technology_projects
    else
      color = "#ffffff"
  end

    populate = D3CategoryProject.create(x: x, y: y, color: color, cat_name: cat_name, sub_cat: sub_cat, total_projects: total_projects)
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

  def convert_to_currency(input)
    raw = input.to_s.split("")
    process = []
    while raw.length > 0
      if raw.length > 2
        process << raw[-3..-1]
        raw.pop(3)
      elsif raw.length > 1
        process << raw[-2..-1]
        raw.pop(2)
      else process << raw[-1]
        raw.pop(1)
      end
      if raw.length > 0
        process.push(",")
      end
    end
    result = process.reverse.join
    return result
  end

  art_funding = compute_total_funding("Art")
  comics_funding = compute_total_funding("Comics")
  dance_funding = compute_total_funding("Dance")
  design_funding = compute_total_funding("Design")
  fashion_funding = compute_total_funding("Fashion")
  filmnvideo_funding = compute_total_funding("Film & Video")
  food_funding = compute_total_funding("Food")
  games_funding = compute_total_funding("Games")
  music_funding = compute_total_funding("Music")
  photography_funding = compute_total_funding("Photography")
  publishing_funding = compute_total_funding("Publishing")
  theater_funding = compute_total_funding("Theater")
  technology_funding = compute_total_funding("Technology")

  # Number of squares needed for each category
  art = (total_square * art_funding / overall_funding)
  comics = art + (total_square * comics_funding / overall_funding)
  dance = comics + (total_square * dance_funding / overall_funding)
  design = dance + (total_square * design_funding / overall_funding)
  fashion = design + (total_square * fashion_funding / overall_funding)
  filmnvideo = fashion + (total_square * filmnvideo_funding / overall_funding)
  food = filmnvideo + (total_square * food_funding / overall_funding)
  games = food + (total_square * games_funding / overall_funding)
  music = games + (total_square * music_funding / overall_funding)
  photography = music + (total_square * photography_funding / overall_funding)
  publishing = photography + (total_square * publishing_funding /  overall_funding)
  theater = publishing + (total_square * theater_funding / overall_funding)
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
      total_funding = convert_to_currency(art_funding)
    when art..(comics - 1)
      cat_name = "Comics"
      color = "#fcb26a"
      sub_cat = find_sub_categories("Comics")
      total_funding = convert_to_currency(comics_funding)
    when comics..(dance - 1)
      cat_name = "Dance"
      color = "#fce26a"
      sub_cat = find_sub_categories("Dance")
      total_funding = convert_to_currency(dance_funding)
    when dance..(design - 1)
      cat_name = "Design"
      color = "#c0fc6a"
      sub_cat = find_sub_categories("Design")
      total_funding = convert_to_currency(design_funding)
    when design..(fashion - 1)
      cat_name = "Fashion"
      color = "#6afc89"
      sub_cat = find_sub_categories("Fashion")
      total_funding = convert_to_currency(fashion_funding)
    when fashion..(filmnvideo - 1)
      cat_name = "Film & Video"
      color = "#6afce6"
      sub_cat = find_sub_categories("Film & Video")
      total_funding = convert_to_currency(filmnvideo_funding)
    when filmnvideo..(food - 1)
      cat_name = "Food"
      color = "#6abcfc"
      sub_cat = find_sub_categories("Food")
      total_funding = convert_to_currency(food_funding)
    when food..(games - 1)
      cat_name = "Games"
      color = "#6a7efc"
      sub_cat = find_sub_categories("Games")
      total_funding = convert_to_currency(games_funding)
    when games..(music - 1)
      cat_name = "Music"
      color = "#896afc"
      sub_cat = find_sub_categories("Music")
      total_funding = convert_to_currency(music_funding)
    when music..(photography - 1)
      cat_name = "Photography"
      color = "#ca6afc"
      sub_cat = find_sub_categories("Photography")
      total_funding = convert_to_currency(photography_funding)
    when photography..(publishing - 1)
      cat_name = "Publishing"
      color = "#fc6adf"
      sub_cat = find_sub_categories("Publishing")
      total_funding = convert_to_currency(publishing_funding)
    when publishing..(theater - 1)
      cat_name = "Theater"
      color = "#fc6a93"
      sub_cat = find_sub_categories("Theater")
      total_funding = convert_to_currency(theater_funding)
    when theater..(technology - 1)
      cat_name = "Technology"
      color = "#fc6a6a"
      sub_cat = find_sub_categories("Technology")
      total_funding = convert_to_currency(technology_funding)
    else
      color = "#ffffff"
  end

  populate = D3CategoryFunding.create(x: x, y: y, color: color, cat_name: cat_name, sub_cat: sub_cat, total_funding: total_funding)
    y_counter += 1

    if y == y_stop
      x_counter += 1
      y_counter = 0
    end
    run += 1
  end
end
