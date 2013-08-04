task :scrape_overall_recommended_links => :environment do
  desc "Scrape through Kickstarter Overall Recommended Page"

  mass_url = "http://www.kickstarter.com/discover/recommended?page="
  project_links = []

  for i in 1..3
    page = agent.get(mass_url + i.to_s)
    page.search(".project-thumbnail a").each do |page|
      project_links << page.attr("href")
    end
  end
end

task :scrape_single_project_details => :environment do
  desc "Scrape Single Project Page"

  project_url = "http://www.kickstarter.com"
  title = []
  fund = []

  project_links.each do |url|
    project_page = agent.get(project_url + url)
    title << project_page.search("meta[property='og:title']").attr("content").text.to_s
    fund << project_page.search("meta[property='twitter:data1']").attr("content").text.to_s
  end
end

task :all => [:scrape_overall_recommended_links, :scrape_single_project_details]