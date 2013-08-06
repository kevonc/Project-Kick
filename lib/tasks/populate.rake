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
      cat_name = "arts"
      color = "#d5b92a"
    when art..(comics - 1)
      cat_name = "comics"
      color = "#e36f26"
    when comics..(dance - 1)
      cat_name = "dance"
      color = "#f16776"
    when dance..(design - 1)
      cat_name = "design"
      color = "#d33f35"
    when design..(fashion - 1)
      cat_name = "fashion"
      color = "#b02e30"
    when fashion..(filmnvideo - 1)
      cat_name = "filmnvideo"
      color = "#923442"
    when filmnvideo..(food - 1)
      cat_name = "food"
      color = "#86374d"
    when food..(games - 1)
      cat_name = "games"
      color = "#5b4961"
    when games..(music - 1)
      cat_name = "music"
      color = "#4c9ec3"
    when music..(photography - 1)
      cat_name = "photography"
      color = "#27709d"
    when photography..(publishing - 1)
      cat_name = "publishing"
      color = "#318a6c"
    when publishing..(theater - 1)
      cat_name = "theater"
      color = "#72a94b"
    when theater..(technology - 1)
      cat_name = "technology"
      color = "#873625"
    else
      color = "#000000"
  end

    populate = D3CategoryProject.create(x: x, y: y, color: color, cat_name: cat_name)
    y_counter += 1

    if y == y_stop
      x_counter += 1
      y_counter = 0
    end
    run += 1
  end
end