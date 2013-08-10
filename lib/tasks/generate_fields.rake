desc 'This runs multiple rake tasks to generate neccessary data field in multiple tables'
task :generate_fields => ["populate_category_projects", "populate_category_funding", "convert_city_funding"]