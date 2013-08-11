desc 'This runs multiple rake tasks to generate neccessary data field in multiple tables'
task :generate_fields => ["populate_category_projects", "populate_category_funding", "convert_city_funding"]

desc 'This runs all the scraping tasks for kickstarterdotcom'
task :scrape_everything => ["scrape_recommended", "scrape_recently_launched", "scrape_ending_soon", "scrape_small_projects", "scrape_each_category"]