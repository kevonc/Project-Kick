#encoding: utf-8
require 'mechanize'

task :fix_documentary => :environment do
    desc "Fix outlier in Documentary category"

    Category.find_by_name("Documentary").project_overfunded_percentages = [128.39,142.3333,298.7967, 138.5846, 226.0293, 100.25, 155.51, 136.2228, 101.2154, 106.4, 109.4919, 125.5, 117.4979, 106.4867, 205.0741, 420.18,120.19, 111.72, 121.2571,136.0096, 114.48, 104.3933, 114.2933, 102.23, 105.76, 109.1187, 105.1429, 101.415, 146.132, 117.9938, 114.0567, 131.84, 178.725,107.168, 105.5833, 107.2053,106.7367, 116.4, 101.1347, 111.188, 145.5651, 105.3727, 108.048, 124.9653, 171.75, 109.85, 120.4067, 113.5992, 106.14, 150.1114, 106.4833, 107.99,120.02, 105.0667, 102.7289, 124.92, 118.722, 120.645, 176.9611, 129.08, 152.06, 111.875, 106.1905, 102.332, 105.692,103.3283, 107.1852, 100.7914, 114.6257,129.27, 225.1192, 108.788, 101.3725, 283.32, 292.9, 108.4625, 110.0, 108.7445, 120.74, 101.75, 108.1488, 126.02, 102.26, 139.1, 100.4163, 111.9933,125.6149, 101.1667, 107.36, 109.1533, 118.7308, 107.1848, 116.386, 102.68,  103.3714, 103.0333, 105.6833, 150.1233, 385.1, 103.5871, 102.3008, 108.1875,151.5947, 135.32, 100.0, 128.23, 108.8667,  116.6029, 140.536, 107.45, 104.625, 109.3, 166.8845, 119.75, 102.3279, 143.5179, 119.8449, 154.012,103.875, 111.3182,  172.965, 133.9644, 101.7267, 118.7111, 146.5714, 105.5, 126.2667, 124.1273, 106.86, 106.77, 126.5,202.7, 103.42, 122.1533, 108.2257,107.5738, 101.1867, 136.492, 103.49, 125.982, 105.9375, 162.364, 126.1543, 139.1286, 146.006, 112.9867, 114.5261, 110.35, 102.5, 106.856, 108.732,104.512, 102.5818, 108.326, 101.99, 109.145, 107.596, 110.86, 249.1333, 108.395, 114.6889, 176.3, 131.42, 117.15, 102.0761, 105.1206, 100.165, 110.78,129.6, 101.7667, 113.312, 100.824, 101.482, 109.0304, 105.1, 309.225, 132.06, 102.346, 171.625, 150.3481, 101.45, 118.08, 107.502, 125.65, 110.61,106.86, 118.724, 106.19, 160.7412, 106.8775, 130.32, 118.9444, 131.0667, 108.9176, 101.2, 110.28, 109.3534, 145.346, 107.6, 113.84, 231.6471,101.248,162.6123, 175.0774, 122.125, 139.7167, 124.114, 103.72, 101.0333, 113.4831, 122.8705, 125.4967, 114.35, 109.5029, 166.6, 280.6, 129.0063, 134.5152,104.1373, 103.8286, 107.826, 100.1964, 108.5886, 202.72, 103.38, 117.525, 109.636,  168.008, 105.054, 103.21, 212.4, 128.56, 108.6545, 193.544,119.75, 108.1, 140.7, 112.898, 114.658, 121.98, 163.278, 112.273, 145.48, 103.24, 106.2633, 131.1031, 109.83, 106.18, 118.77, 130.02, 116.808, 158.4029,160.6067, 106.836, 196.3774, 157.52, 109.8417, 104.0167, 100.8333, 536.7033, 121.0, 135.68, 118.39, 158.4625, 106.53, 118.36, 111.7875, 113.1486, 122.7667, 130.196, 111.4, 118.66, 107.0933, 111.5, 139.9, 177.2182, 118.83, 113.1778, 269.2067, 104.28, 100.004, 107.2579, 100.925, 100.7692, 107.4,144.7977, 125.5714, 155.1, 127.7593, 102.022, 118.2, 136.37, 115.152, 169.26, 101.6762, 130.3231, 118.15, 167.18, 102.9083, 106.6383, 100.324, 126.6164,364.4778, 106.925, 104.2029, 103.5943, 185.34, 161.7714, 110.4125, 125.525, 110.2296, 111.3875, 101.28, 109.2467, 103.7917, 101.625, 117.3167, 147.4105,121.88, 156.0, 598.5133,  119.6, 544.3333, 110.705, 113.6824, 103.4033, 100.7333, 112.0072, 113.9773, 133.8467, 108.052, 108.1273, 131.88, 107.5933,117.0167, 130.3333, 139.1733, 109.1294, 115.4, 124.3382, 100.46, 108.2, 214.0667, 100.37, 177.26, 352.708, 132.08, 111.6477, 153.3333, 102.5263, 118.4,145.4, 149.1933, 104.625, 103.01, 110.0183, 100.4444, 110.75, 107.81, 140.4625, 100.0, 171.7578, 101.07, 107.056, 100.6145, 161.4197, 130.725, 104.5111,122.336, 142.3733, 278.8625, 100.7187, 125.2121, 104.4133, 100.975, 101.7583, 121.4286, 101.3329, 106.14, 103.92, 105.3187, 114.925, 110.6552, 104.4,108.0133, 102.948, 112.28, 113.4615, 103.364, 147.4933, 150.2, 107.67, 122.6, 111.3766, 104.8, 134.7179, 113.3667, 110.0267, 105.44, 111.605,  149.4338,101.5067, 122.52, 100.5996, 102.98, 120.7, 102.324, 100.24, 101.7667, 144.0, 195.1625, 111.675, 101.1523, 120.496, 105.216, 104.1, 100.928, 109.4556,154.8275, 116.0, 105.9625, 118.801, 105.075, 110.12, 103.25, 110.672, 103.2, 109.7, 100.13, 108.58, 105.5133, 187.9741, 114.05, 104.545, 109.8667,105.8222, 156.26, 130.5, 156.5316, 128.705, 103.2033,  104.3174, 114.32, 113.7767, 116.552, 111.02, 100.3333, 132.2833, 178.548, 116.0769, 124.66,124.3, 103.635, 191.66, 101.4063, 122.8, 127.6667, 100.6111, 245.7538, 112.012, 111.3733, 103.9172, 130.5, 210.41, 121.679, 102.52, 133.5667, 100.07,128.335, 125.5, 127.6467, 105.4667, 100.5, 107.76, 139.32, 105.0833, 184.05, 171.6, 149.86, 114.2722, 103.4419, 126.52, 108.38, 122.056, 114.232,146.44, 143.92, 300.912, 118.624, 101.72, 107.8, 200.88, 103.9993, 275.275, 110.216, 152.6087, 133.76, 128.39, 142.3333, 298.7967, 138.5846, 226.0293,100.25, 155.51, 136.2228, 101.2154, 106.4, 109.4919, 125.5,   117.4979, 106.4867, 205.0741, 420.18, 120.19, 111.72, 121.2571, 103.0, 260.875, 130.5875,170.75, 160.46, 105.5667, 157.51, 139.4176, 158.5, 121.888, 106.725, 165.6, 105.0, 118.4667, 120.4333, 190.25, 240.0, 117.34, 146.85, 118.1, 109.1364,103.4286,103.4867, 101.8222, 112.91, 169.1, 104.54, 122.28, 123.445, 136.86, 139.32, 115.9, 104.3733, 108.17, 124.84,103.7733, 106.1125, 102.5533, 201.72, 127.0,104.2333, 101.1, 101.11, 133.0, 104.0, 101.1429, 101.7238, 176.475, 305.46, 202.81, 105.02, 101.28, 118.42, 100.775, 109.8, 148.2, 178.95, 108.8,113.82, 185.5, 133.44, 148.5833, 109.1711, 172.5, 231.44, 134.1, 101.7083, 113.4175, 104.7619, 111.3091, 117.0, 128.5, 119.5692, 104.6154, 125.4, 101.56, 100.6, 118.455, 103.3333, 123.76, 122.9394, 110.6795, 104.7353, 104.3, 113.44, 164.84, 105.3333, 111.8, 110.6201, 117.4063,106.4, 114.5333, 104.0333, 101.82, 236.9167, 108.17, 103.5, 104.06, 100.2167, 220.1, 104.6889, 111.1, 105.02, 106.1, 119.2667, 404.5333, 112.196, 107.0, 197.6667, 177.4333, 148.64, 101.1111, 107.3467, 100.5905, 113.7429, 263.4, 120.64, 161.5517, 101.1889, 102.3909, 108.84, 118.3333, 204.5667, 314.64, 112.68, 146.0, 102.024, 100.0, 100.24, 107.7711]
end

task :scrape_recommended => :environment do
  desc "Scrape through Kickstarter Overall Recommended Page"

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/recommended?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 564) # max: 564 - pages 464 and 488 493 520 break the scrape because of a project with no location
  create_record(agent, project_links)
end

task :scrape_recently_launched => :environment do
  desc "Scrape through Kickstarter Recently Launched Page"

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/recently-launched?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 53) # max: 53
  create_record(agent, project_links)
end

task :scrape_ending_soon => :environment do
  desc "Scrape through Kickstarter Ending Soon Page"

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/ending-soon?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 38) # max: 38
  create_record(agent, project_links)
end

task :scrape_small_projects => :environment do
  desc "Scrape through Kickstarter Small Projects Page"

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/small-projects?page="
  project_links = []

  get_project_urls(agent, mass_url, project_links, 14) # max: 14
  create_record(agent, project_links)
end

task :scrape_each_category => :environment do
  desc "Scrape through Kickstarter Individual Category Page"

  agent = Mechanize.new
  all_links = ['http://www.kickstarter.com/discover/categories/art/recommended?page=',
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
    main_category = ""

    city_name = project_page.search("#project-metadata .location a").text.gsub("\n","")

    # exclude countries other than US
    if city_name.match /\s\w\w$/
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

      # Consider moving this to a function
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
          main_category = key
        end
      end

      category.main_category = main_category
      if category.project_overfunded_percentages.nil?
        category.project_overfunded_percentages = []
        category.project_overfunded_percentages << overfunded if expired == true
      else
        category.project_overfunded_percentages << overfunded if expired == true
      end
      category.save

      puts "Scraping #{city_name}"
      project = Project.create(title: title, backers: backers, funding: funding, goal: goal, overfunded: overfunded, expired: expired, city_id: city.id, category_id: category.id)
    else
      puts "----------Outside US, discarding #{city_name}"
    end
  end
end