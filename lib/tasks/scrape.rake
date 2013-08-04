require 'mechanize'

task :scrape => :environment do
  desc "Scrape through Kickstarter Overall Recommended Page"

  agent = Mechanize.new
  mass_url = "http://www.kickstarter.com/discover/recommended?page="
  project_links = []

  # Specify page range
  for i in 1..2
    page = agent.get(mass_url + i.to_s)
    page.search(".project-thumbnail a").each do |project|
      project_links << project.attr("href")
    end
  end

  project_url = "http://www.kickstarter.com"

  project_links.each do |url|
    project_page = agent.get(project_url + url)
    title = project_page.search("meta[property='og:title']").attr("content").text.to_s
    backers = page.search("#backers_nav .count").children.attr("value").value.to_i
    funding = page.search("meta[property='twitter:data1']").attr("content").text.gsub("$","").gsub(",","").to_i
    goal = page.search("meta[property='twitter:label1']").attr("content").text.gsub("PLEDGED OF $","").gsub(",","").to_i
    city_name = page.search("#project-metadata .location a").text.gsub("\n","")
    city = City.find_or_create_by_name(city_name)
    category_name = page.search("#project-metadata .category a").text.gsub("\n","")
    category = Category.find_or_create_by_name(category_name)
    project = Project.create(title: title, backers: backers, funding: funding, goal: goal, city_id: city.id, category_id: category.id)
  end
end