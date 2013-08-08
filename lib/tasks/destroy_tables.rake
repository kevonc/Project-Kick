task :destroy_tables => :environment do
  desc "Destroy all records in all tables"

  Project.destroy_all
  Category.destroy_all
  City.destroy_all
  D3CategoryProject.destroy_all
  D3CategoryFunding.destroy_all
end