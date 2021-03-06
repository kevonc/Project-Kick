#encoding: utf-8
require 'mechanize'

desc "Scrape through Kickstarter Overall Recommended Page"
task :scrape_recommended => :environment do

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/recommended?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 150) # max: 564 - pages 464 and 488 493 520 break the scrape because of a project with no location
  create_record(agent, project_links)
end

desc "Scrape through Kickstarter Recently Launched Page"
task :scrape_recently_launched => :environment do

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/recently-launched?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 53) # max: 53
  create_record(agent, project_links)
end

desc "Scrape through Kickstarter Ending Soon Page"
task :scrape_ending_soon => :environment do

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/ending-soon?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 38) # max: 38
  create_record(agent, project_links)
end

desc "Scrape through Kickstarter Small Projects Page"
task :scrape_small_projects => :environment do

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/small-projects?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 14) # max: 14
  create_record(agent, project_links)
end

desc "Scrape through Kickstarter Individual Category Page"
task :scrape_each_category => :environment do

  agent = Mechanize.new
  all_links = [
    'http://www.kickstarter.com/discover/categories/art/recommended?page=',
              'http://www.kickstarter.com/discover/categories/art/popular?page=',
              'http://www.kickstarter.com/discover/categories/art/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/art/successful?page=',

              'http://www.kickstarter.com/discover/categories/comics/recommended?page=',
              'http://www.kickstarter.com/discover/categories/comics/popular?page=',
              'http://www.kickstarter.com/discover/categories/comics/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/comics/successful?page=',

              'http://www.kickstarter.com/discover/categories/dance/recommended?page=',
              'http://www.kickstarter.com/discover/categories/dance/popular?page=',
              'http://www.kickstarter.com/discover/categories/dance/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/dance/successful?page=',

              'http://www.kickstarter.com/discover/categories/design/recommended?page=',
              'http://www.kickstarter.com/discover/categories/design/popular?page=',
              'http://www.kickstarter.com/discover/categories/design/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/design/successful?page=',

              'http://www.kickstarter.com/discover/categories/fashion/recommended?page=',
              'http://www.kickstarter.com/discover/categories/fashion/popular?page=',
              'http://www.kickstarter.com/discover/categories/fashion/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/fashion/successful?page=',

              'http://www.kickstarter.com/discover/categories/film%20&%20video/recommended?page=',
              'http://www.kickstarter.com/discover/categories/film%20&%20video/popular?page=',
              'http://www.kickstarter.com/discover/categories/film%20&%20video/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/film%20&%20video/successful?page=',

              'http://www.kickstarter.com/discover/categories/food/recommended?page=',
              'http://www.kickstarter.com/discover/categories/food/popular?page=',
              'http://www.kickstarter.com/discover/categories/food/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/food/successful?page=',

              'http://www.kickstarter.com/discover/categories/games/recommended?page=',
              'http://www.kickstarter.com/discover/categories/games/popular?page=',
              'http://www.kickstarter.com/discover/categories/games/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/games/successful?page=',

              'http://www.kickstarter.com/discover/categories/music/recommended?page=',
              'http://www.kickstarter.com/discover/categories/music/popular?page=',
              'http://www.kickstarter.com/discover/categories/music/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/music/successful?page=',

              'http://www.kickstarter.com/discover/categories/photography/recommended?page=',
              'http://www.kickstarter.com/discover/categories/photography/popular?page=',
              'http://www.kickstarter.com/discover/categories/photography/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/photography/successful?page=',

              'http://www.kickstarter.com/discover/categories/publishing/recommended?page=',
              'http://www.kickstarter.com/discover/categories/publishing/popular?page=',
              'http://www.kickstarter.com/discover/categories/publishing/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/publishing/successful?page=',

              'http://www.kickstarter.com/discover/categories/technology/recommended?page=',
              'http://www.kickstarter.com/discover/categories/technology/popular?page=',
              'http://www.kickstarter.com/discover/categories/technology/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/technology/successful?page=',

              'http://www.kickstarter.com/discover/categories/theater/recommended?page=',
              'http://www.kickstarter.com/discover/categories/theater/popular?page=',
              'http://www.kickstarter.com/discover/categories/theater/most-funded?page=',
              'http://www.kickstarter.com/discover/categories/theater/successful?page=',
  ]

  all_links.each do |url|
    project_links = []

    get_project_urls(agent, url, project_links, 100) # run up to 100 pages
    create_record(agent, project_links)
  end
end

def get_project_urls(agent, mass_url, project_links, ending_page)
  for i in 1..ending_page
    page = agent.get(mass_url + i.to_s)
    page.search(".project-thumbnail a").each do |project|
      project_links << project.attr("href")
    end
  end
end

def create_record(agent, project_links)
  def include_only_us_projects(city)
    return true if city.match /\s\w\w$/
  end

  def find_main_category(category_name)
    categories = {"Art" => ["Art", "Conceptual Art", "Crafts", "Digital Art", "Illustration", "Painting", "Performance Art",
                              "Mixed Media", "Public Art", "Sculpture"],
                  "Comics" => ["Comics"],
                  "Dance" => ["Dance"],
                  "Design" => ["Design", "Graphic Design", "Product Design"],
                  "Fashion" => ["Fashion"],
                  "Film & Video" => ["Film & Video", "Animation", "Documentary", "Narrative", "Film", "Narrative Film", "Short Film", "Webseries"],
                  "Food" => ["Food"],
                  "Games" => ["Games", "Tabletop Games", "Video Games"],
                  "Music" => ["Music", "Classical Music", "Country & Folk", "Electronic Music", "Hip-Hop", "Indie Rock", "Jazz",
                              "Pop", "Rock", "World Music"],
                  "Photography" => ["Photography"],
                  "Publishing" => ["Publishing", "Art Book", "Children's Book", "Fiction", "Journalism", "Nonfiction", "Periodical",
                                   "Poetry", "Radio & Podcast"],
                  "Technology" => ["Technology", "Hardware", "Open Software"],
                  "Theater" => ["Theater"]}

    categories.each do |key, value|
      if value.include? category_name
        return key
      end
    end
  end

  def check_category_overfunded_status(category, overfunded, expired)
    if category.project_overfunded_percentages.nil?
      category.project_overfunded_percentages = []
      category.project_overfunded_percentages << overfunded if expired == true
    else
      category.project_overfunded_percentages << overfunded if expired == true
    end
  end

  def check_project_existence(title)
    return true unless Project.find_by_title(title)
  end

  project_url = "http://www.kickstarter.com"

  project_links.each do |url|
    project_page = agent.get(project_url + url)
    title = project_page.search("meta[property='og:title']").attr("content").text
    backers = project_page.search("#backers_nav .count data").attr("value").value.to_i
    funding = project_page.search("meta[property='twitter:data1']").attr("content").text.gsub("$","").gsub("£","").gsub(",","").to_i
    goal = project_page.search("meta[property='twitter:label1']").attr("content").text.gsub("PLEDGED OF $","").gsub("PLEDGED OF £","").gsub(",","").to_i
    days_left = project_page.search("meta[property='twitter:data2']").attr("content").value.to_i
    days_left == 0 ? expired = true : expired = false
    overfunded = ((funding.to_f / goal.to_f) * 100).round(4) if expired == true
    city_name = project_page.search("#project-metadata .location a").text.gsub("\n","")

    if check_project_existence(title)
      if include_only_us_projects(city_name)
        latitude = project_page.search("meta[property='kickstarter:location:latitude']").attr("content").value.to_f
        longitude = project_page.search("meta[property='kickstarter:location:longitude']").attr("content").value.to_f
        city = City.find_or_create_by_name(city_name)
        city.latitude = latitude
        city.longitude = longitude
        city.total_projects += 1
        city.total_funding += funding
        city.save

        category_name = project_page.search("#project-metadata .category a").text.gsub("\n","")
        category = Category.find_or_create_by_name(category_name)
        category.total_projects += 1
        category.total_funding += funding
        category.main_category = find_main_category(category_name)
        check_category_overfunded_status(category, overfunded, expired)
        category.save

        puts "Scraping #{city_name}"
        project = Project.create(title: title, backers: backers, funding: funding, goal: goal, overfunded: overfunded, expired: expired, city_id: city.id, category_id: category.id)
      else
        puts "----------Outside US, discarding #{city_name}"
      end
    else
      puts ">>>>>>>>>>>>>>>>>>>>>>>>>Duplicated Project: #{title}"
    end
  end
end