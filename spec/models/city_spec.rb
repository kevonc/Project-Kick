require 'spec_helper'

describe City do
  context "when first created" do
    it "should not create duplicated city record" do
      page = @agent.get(@project_page)
      newyork = City.new(name: 'New York, NY')
      newyork2 = City.new(name: 'New York, NY')
      City.count.should == 1
    end
  end
end