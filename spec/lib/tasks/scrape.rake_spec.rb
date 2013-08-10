# require 'spec_helper'
require 'rake'
require 'Mechanize'

describe "scrape recommended task" do
  before do
    @agent = Mechanize.new
    @listing_page = "http://www.kickstarter.com/discover/recommended?page=1"
    @project_page = "http://www.kickstarter.com/projects/weargustin/gustin-redefining-premium-menswear-starting-with-d"
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require '../lib/tasks/scrape'
  end

  it "should have environment as a prereq" do
    @rake[:scrape_recommended].prerequisites.should include("environment")
  end

  it "should get an object from scraping Kickstarter's listing page" do
    page = @agent.get(@listing_page)
    expect(page).to be_an Object
  end

  it "should get a project link string from scraping Kickstarter listing page" do
    page = @agent.get(@listing_page)
    expect(page.search(".project-thumbnail a").attr("href").value).to be_a String
  end

  it "should get an object from scraping Kickstarter's project page" do
    page = @agent.get(@project_page)
    expect(page).to be_an Object
  end

  it "should get a project title from project page" do
    page = @agent.get(@project_page)
    expect(page.search("meta[property='og:title']").attr("content").text).to be_a String
  end

  it "should get a number of backers from project page" do
    page = @agent.get(@project_page)
    expect(page.search("#backers_nav .count data").attr("value").value.to_i).to be_a Integer
  end

  it "should get the amount of funding from project page" do
    page = @agent.get(@project_page)
    expect(page.search("meta[property='twitter:data1']").attr("content").text).to be_a String
  end

  it "should get funding goal from project page" do
    page = @agent.get(@project_page)
    expect(page.search("meta[property='twitter:label1']").attr("content").text).to be_a String
  end

  it "should get a latitude from project page" do
    page = @agent.get(@project_page)
    expect(page.search("meta[property='kickstarter:location:latitude']").attr("content").value.to_f).to be_a Float
  end

  it "should get a longitude from project page" do
    page = @agent.get(@project_page)
    expect(page.search("meta[property='kickstarter:location:longitude']").attr("content").value.to_f).to be_a Float
  end

  it "should get a days left number from project page" do
    page = @agent.get(@project_page)
    expect(page.search("meta[property='twitter:data2']").attr("content").value.to_i).to be_a Integer
  end

  it "should get a city name from project page" do
    page = @agent.get(@project_page)
    expect(page.search("#project-metadata .location a").text).to be_a String
  end

  it "should get a category name from project page" do
    page = @agent.get(@project_page)
    expect(page.search("#project-metadata .category a").text).to be_a String
  end
end